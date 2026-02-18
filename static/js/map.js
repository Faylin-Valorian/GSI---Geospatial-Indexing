(function () {
    let map = null;
    let activeLayer = null;
    let stateOverlayLayer = null;
    let countyOverlayLayer = null;
    let statesTopoPromise = null;
    let countiesTopoPromise = null;
    let countyStatusByFips = new Map();
    let activeStateFips = new Set();
    let activeCountyPopup = null;
    let cachedStateFeatures = [];
    let cachedCountyFeatures = [];
    let overlayControl = null;

    const US_STATES_TOPO_URL = "https://cdn.jsdelivr.net/npm/us-atlas@3/states-10m.json";
    const US_COUNTIES_TOPO_URL = "https://cdn.jsdelivr.net/npm/us-atlas@3/counties-10m.json";
    const OVERLAY_PREFS_KEY = "gsi_map_overlay_prefs_v1";

    const layers = {
        dark: L.tileLayer("https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png", {
            maxZoom: 20,
            attribution: "&copy; OpenStreetMap &copy; CARTO"
        }),
        light: L.tileLayer("https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png", {
            maxZoom: 20,
            attribution: "&copy; OpenStreetMap &copy; CARTO"
        })
    };

    const STATUS_STYLE = {
        completed: { color: "#26c86f", fillColor: "#12b857", fillOpacity: 0.50, weight: 0.9 },
        working_self: { color: "#1746b3", fillColor: "#123d9f", fillOpacity: 0.56, weight: 0.9 },
        working_other: { color: "#7bb8ff", fillColor: "#69abff", fillOpacity: 0.54, weight: 0.9 },
        in_progress: { color: "#ffc928", fillColor: "#ffbe0b", fillOpacity: 0.48, weight: 0.9 },
        active_job: { color: "#7f8896", fillColor: "#6f7886", fillOpacity: 0.42, weight: 0.85 },
        active: { color: "#ff6262", fillColor: "#ff3030", fillOpacity: 0.33, weight: 0.8 },
        inactive: { color: "#8a8a8a", fillColor: "#8a8a8a", fillOpacity: 0.02, weight: 0.2 },
    };

    const overlayPrefs = {
        showStates: true,
        showCounties: true,
        statuses: {
            active: true,
            active_job: true,
            in_progress: true,
            working_self: true,
            working_other: true,
            completed: true,
        },
    };

    function reportDebug(error, context = {}) {
        if (window.GSIDebug && typeof window.GSIDebug.reportError === "function") {
            window.GSIDebug.reportError(error, context);
        }
    }

    async function popupAlert(message, title = "Notice") {
        if (window.GSICore && typeof window.GSICore.popupAlert === "function") {
            return window.GSICore.popupAlert(message, { title });
        }
        window.alert(message);
        return true;
    }

    async function popupConfirm(message, title = "Confirm") {
        if (window.GSICore && typeof window.GSICore.popupConfirm === "function") {
            return window.GSICore.popupConfirm(message, { title, confirmText: "Confirm", cancelText: "Cancel" });
        }
        return window.confirm(message);
    }

    function csrfToken() {
        const meta = document.querySelector('meta[name="csrf-token"]');
        return meta ? meta.getAttribute("content") || "" : "";
    }

    function escapeHtml(value) {
        return String(value || "")
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#39;");
    }

    function chooseLayer(theme) {
        return theme === "light" ? layers.light : layers.dark;
    }

    function applyTheme(theme) {
        if (!map) return;
        const next = chooseLayer(theme);
        if (activeLayer) map.removeLayer(activeLayer);
        activeLayer = next;
        activeLayer.addTo(map);
    }

    function normalizeFips(value, width) {
        return String(value || "").trim().padStart(width, "0");
    }

    function transparentCountyStyle() {
        return { color: "transparent", fillColor: "transparent", fillOpacity: 0, weight: 0 };
    }

    function saveOverlayPrefs() {
        try {
            window.localStorage.setItem(OVERLAY_PREFS_KEY, JSON.stringify(overlayPrefs));
        } catch (_) {}
    }

    function loadOverlayPrefs() {
        try {
            const raw = window.localStorage.getItem(OVERLAY_PREFS_KEY);
            if (!raw) return;
            const parsed = JSON.parse(raw);
            overlayPrefs.showStates = parsed.showStates !== false;
            overlayPrefs.showCounties = parsed.showCounties !== false;
            const statuses = parsed.statuses || {};
            Object.keys(overlayPrefs.statuses).forEach((key) => {
                overlayPrefs.statuses[key] = statuses[key] !== false;
            });
        } catch (_) {}
    }

    function isStatusVisible(status) {
        if (status === "inactive") return false;
        return !!overlayPrefs.statuses[status];
    }

    async function fetchJson(url, opts = {}) {
        const res = await fetch(url, opts);
        let data = null;
        try { data = await res.json(); } catch (_) {}
        if (!res.ok) {
            const msg = data && data.message ? data.message : `Request failed (${res.status})`;
            const err = new Error(msg);
            reportDebug(err, { source: "map_api", path: url, method: opts.method || "GET", status: res.status });
            throw err;
        }
        return data || {};
    }

    function getStatesTopo() {
        if (!statesTopoPromise) statesTopoPromise = fetchJson(US_STATES_TOPO_URL);
        return statesTopoPromise;
    }

    function getCountiesTopo() {
        if (!countiesTopoPromise) countiesTopoPromise = fetchJson(US_COUNTIES_TOPO_URL);
        return countiesTopoPromise;
    }

    function removeOverlayLayers() {
        if (!map) return;
        if (stateOverlayLayer) {
            map.removeLayer(stateOverlayLayer);
            stateOverlayLayer = null;
        }
        if (countyOverlayLayer) {
            map.removeLayer(countyOverlayLayer);
            countyOverlayLayer = null;
        }
    }

    function closeActiveCountyPopup() {
        if (!map || !activeCountyPopup) return;
        try {
            map.closePopup(activeCountyPopup);
        } catch (_) {}
        activeCountyPopup = null;
    }

    function drawStateOverlays(features) {
        if (!map || !features.length) return;
        stateOverlayLayer = L.geoJSON(features, {
            pane: "stateOverlayPane",
            interactive: false,
            style: {
                color: "#d5f2ff",
                weight: 1.4,
                opacity: 0.9,
                fillColor: "#9edfff",
                fillOpacity: 0.1,
            },
        }).addTo(map);
    }

    function countyStyle(feature) {
        const fips = normalizeFips(feature.id, 5);
        const status = countyStatusByFips.get(fips) || "inactive";
        if (!overlayPrefs.showCounties || !isStatusVisible(status)) return transparentCountyStyle();
        return STATUS_STYLE[status] || STATUS_STYLE.inactive;
    }

    function renderOverlayLayers() {
        removeOverlayLayers();
        if (overlayPrefs.showStates) drawStateOverlays(cachedStateFeatures);
        if (overlayPrefs.showCounties) drawCountyOverlays(cachedCountyFeatures);
    }

    function syncOverlayControlUI() {
        const root = document.querySelector(".map-overlay-control");
        if (!root) return;
        root.querySelectorAll("[data-overlay-setting]").forEach((el) => {
            const key = el.getAttribute("data-overlay-setting");
            if (key === "show_states") el.checked = !!overlayPrefs.showStates;
            if (key === "show_counties") el.checked = !!overlayPrefs.showCounties;
        });
        root.querySelectorAll("[data-overlay-status]").forEach((el) => {
            const key = el.getAttribute("data-overlay-status");
            if (key && key in overlayPrefs.statuses) el.checked = !!overlayPrefs.statuses[key];
        });
    }

    function createOverlayControl() {
        if (!map || overlayControl) return;
        overlayControl = L.control({ position: "topright" });
        overlayControl.onAdd = function () {
            const container = L.DomUtil.create("div", "leaflet-bar map-overlay-control");
            container.innerHTML = `
                <div class="map-overlay-control-head">
                    <button type="button" class="map-overlay-control-toggle" data-action="toggle-overlay-panel">
                        Layers
                    </button>
                </div>
                <div class="map-overlay-control-body is-collapsed" data-overlay-body>
                    <div class="map-overlay-group">
                        <label><input type="checkbox" data-overlay-setting="show_states" checked> State Overlay</label>
                        <label><input type="checkbox" data-overlay-setting="show_counties" checked> County Overlay</label>
                    </div>
                    <div class="map-overlay-group">
                        <div class="map-overlay-group-title">County Status Filters</div>
                        <label><input type="checkbox" data-overlay-status="active" checked> Red: No Job</label>
                        <label><input type="checkbox" data-overlay-status="active_job" checked> Grey: Active Job</label>
                        <label><input type="checkbox" data-overlay-status="in_progress" checked> Yellow: In Progress</label>
                        <label><input type="checkbox" data-overlay-status="working_self" checked> Dark Blue: Working (You)</label>
                        <label><input type="checkbox" data-overlay-status="working_other" checked> Light Blue: Working (Other)</label>
                        <label><input type="checkbox" data-overlay-status="completed" checked> Green: Complete</label>
                    </div>
                    <button type="button" class="map-overlay-reset" data-action="reset-overlay-filters">Reset Defaults</button>
                </div>
            `;
            L.DomEvent.disableClickPropagation(container);
            L.DomEvent.disableScrollPropagation(container);
            return container;
        };
        overlayControl.addTo(map);

        const root = document.querySelector(".map-overlay-control");
        if (!root) return;
        syncOverlayControlUI();

        root.addEventListener("click", (event) => {
            const btn = event.target.closest("button");
            if (!btn) return;
            const action = btn.getAttribute("data-action");
            if (action === "toggle-overlay-panel") {
                const body = root.querySelector("[data-overlay-body]");
                if (body) body.classList.toggle("is-collapsed");
            }
            if (action === "reset-overlay-filters") {
                overlayPrefs.showStates = true;
                overlayPrefs.showCounties = true;
                Object.keys(overlayPrefs.statuses).forEach((k) => { overlayPrefs.statuses[k] = true; });
                saveOverlayPrefs();
                syncOverlayControlUI();
                renderOverlayLayers();
            }
        });

        root.addEventListener("change", (event) => {
            const target = event.target;
            if (!(target instanceof HTMLInputElement)) return;
            const setting = target.getAttribute("data-overlay-setting");
            const status = target.getAttribute("data-overlay-status");
            if (setting === "show_states") overlayPrefs.showStates = target.checked;
            if (setting === "show_counties") overlayPrefs.showCounties = target.checked;
            if (status && status in overlayPrefs.statuses) overlayPrefs.statuses[status] = target.checked;
            saveOverlayPrefs();
            renderOverlayLayers();
        });
    }

    function toggleButtonMarkup(label, field, isOn, disabled) {
        const activeClass = isOn ? "is-active" : "";
        return `<button type="button" class="county-toggle-btn ${activeClass}" data-toggle-field="${field}" data-on="${isOn ? "1" : "0"}" ${disabled ? "disabled" : ""}>${label}</button>`;
    }

    function buildCountyPopupMarkup(details) {
        const county = details.county || {};
        const isWorkingByOther = county.is_working && county.working_user_id && county.working_user_id !== details.current_user_id;
        const isReadonly = (isWorkingByOther || county.is_completed);

        return `
            <div class="county-popup" data-county-popup="${county.county_fips}">
                <div class="county-popup-title">${escapeHtml(county.county_name)}, ${escapeHtml(county.state_name)}</div>
                ${county.is_completed ? '<div class="county-popup-note county-popup-note-success">Marked complete.</div>' : ""}
                ${county.is_working && county.working_username ? `<div class="county-popup-note">Working: <strong>${escapeHtml(county.working_username)}</strong></div>` : ""}
                <div class="county-popup-grid">
                    ${toggleButtonMarkup("In Progress", "is_in_progress", !!county.is_in_progress, isReadonly)}
                    ${toggleButtonMarkup("Working On", "is_working", !!county.is_working, isReadonly)}
                    ${toggleButtonMarkup("Split Image Job", "is_split_job", !!county.is_split_job, isReadonly)}
                </div>
                <div class="county-popup-field">
                    <label>Notes</label>
                    <textarea data-field="notes" class="form-control form-control-sm" rows="4" ${isReadonly ? "disabled" : ""}>${escapeHtml(county.notes || "")}</textarea>
                </div>
                <div class="county-popup-actions">
                    <button class="btn btn-sm btn-outline-secondary" data-action="complete-county" data-is-completed="${county.is_completed ? "1" : "0"}">${county.is_completed ? "Unmark As Complete" : "Mark As Complete"}</button>
                </div>
            </div>
        `;
    }

    function getPopupRoot(countyFips) {
        return document.querySelector(`[data-county-popup="${countyFips}"]`);
    }

    function getToggleValue(root, field) {
        const btn = root.querySelector(`[data-toggle-field="${field}"]`);
        return btn ? btn.dataset.on === "1" : false;
    }

    async function saveCountyWork(countyFips, root) {
        const notes = root.querySelector('[data-field="notes"]');
        await fetchJson(`/api/counties/${countyFips}/work`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "X-CSRF-Token": csrfToken(),
            },
            body: JSON.stringify({
                notes: notes ? notes.value : "",
                is_in_progress: getToggleValue(root, "is_in_progress"),
                is_working: getToggleValue(root, "is_working"),
                is_split_job: getToggleValue(root, "is_split_job"),
            }),
        });
    }

    async function reopenCountyPopup(countyFips) {
        const latlng = activeCountyPopup && typeof activeCountyPopup.getLatLng === "function"
            ? activeCountyPopup.getLatLng()
            : (map ? map.getCenter() : null);
        if (!latlng) return;
        await openCountyPopup(countyFips, latlng);
    }

    async function openCountyPopup(countyFips, latlng) {
        const payload = await fetchJson(`/api/counties/${countyFips}/work`);
        const html = buildCountyPopupMarkup(payload);
        const compact = window.matchMedia("(max-width: 991.98px)").matches;
        const popupOptions = compact
            ? { maxWidth: 360, minWidth: 250, keepInView: true, autoPan: true, autoPanPadding: [18, 18] }
            : { maxWidth: 560, minWidth: 460 };

        if (activeCountyPopup) map.closePopup(activeCountyPopup);
        activeCountyPopup = L.popup(popupOptions)
            .setLatLng(latlng)
            .setContent(html)
            .openOn(map);

        wirePopupInteractions(countyFips, payload);
    }

    async function wirePopupInteractions(countyFips, payload) {
        const root = getPopupRoot(countyFips);
        if (!root) return;
        const splitBtn = root.querySelector('[data-toggle-field="is_split_job"]');
        if (splitBtn) splitBtn.dataset.prevOn = splitBtn.dataset.on || "0";
        const notesField = root.querySelector('[data-field="notes"]');
        let notesSaveTimer = null;

        if (notesField) {
            notesField.addEventListener("input", () => {
                if (notesSaveTimer) window.clearTimeout(notesSaveTimer);
                notesSaveTimer = window.setTimeout(async () => {
                    try {
                        await saveCountyWork(countyFips, root);
                    } catch (err) {
                        await popupAlert(err.message || "Unable to save notes.", "Save Failed");
                    }
                }, 450);
            });
            notesField.addEventListener("blur", async () => {
                if (notesSaveTimer) {
                    window.clearTimeout(notesSaveTimer);
                    notesSaveTimer = null;
                }
                try {
                    await saveCountyWork(countyFips, root);
                } catch (err) {
                    await popupAlert(err.message || "Unable to save notes.", "Save Failed");
                }
            });
        }

        root.addEventListener("click", async (event) => {
            const toggleBtn = event.target.closest("[data-toggle-field]");
            if (toggleBtn) {
                if (toggleBtn.hasAttribute("disabled")) return;

                const field = toggleBtn.dataset.toggleField;
                const next = toggleBtn.dataset.on !== "1";
                if (field === "is_split_job") {
                    const ok = await popupConfirm(
                        next
                            ? "Enable Split Image Job for this county?"
                            : "Disable Split Image Job for this county?",
                        "Confirm Split Image Job"
                    );
                    if (!ok) return;
                }
                toggleBtn.dataset.on = next ? "1" : "0";
                toggleBtn.classList.toggle("is-active", next);

                // If In Progress is toggled on, Working On must be toggled off.
                if (field === "is_in_progress" && next) {
                    const workingBtn = root.querySelector('[data-toggle-field="is_working"]');
                    if (workingBtn) {
                        workingBtn.dataset.on = "0";
                        workingBtn.classList.remove("is-active");
                    }
                }
                if (field === "is_working" && next) {
                    const progressBtn = root.querySelector('[data-toggle-field="is_in_progress"]');
                    if (progressBtn) {
                        progressBtn.dataset.on = "0";
                        progressBtn.classList.remove("is-active");
                    }
                }

                try {
                    await saveCountyWork(countyFips, root);
                    document.dispatchEvent(new Event("map:overlay-data-changed"));
                } catch (err) {
                    await popupAlert(err.message || "Unable to save county workflow.", "Save Failed");
                }
                return;
            }

            const target = event.target.closest("button");
            if (!target) return;
            const action = target.dataset.action;
            if (!action) return;
            try {
                if (action === "complete-county") {
                    const isCompleted = target.dataset.isCompleted === "1";
                    if (isCompleted) {
                        const ok = await popupConfirm(
                            "If you proceed, this county will be reopened and others can activate the job and edit it again. Continue?",
                            "Reopen County?"
                        );
                        if (!ok) return;
                    }
                    await fetchJson(`/api/counties/${countyFips}/work/complete`, {
                        method: "POST",
                        headers: { "X-CSRF-Token": csrfToken(), "Content-Type": "application/json" },
                        body: JSON.stringify({ is_completed: !isCompleted }),
                    });
                    await reopenCountyPopup(countyFips);
                    document.dispatchEvent(new Event("map:overlay-data-changed"));
                }
            } catch (err) {
                await popupAlert(err.message || "Request failed.", "Request Failed");
            }
        });
    }

    function drawCountyOverlays(features) {
        if (!map || !features.length) return;
        countyOverlayLayer = L.geoJSON(features, {
            pane: "countyOverlayPane",
            interactive: true,
            style: countyStyle,
            onEachFeature(feature, layer) {
                const countyFips = normalizeFips(feature.id, 5);
                layer.on("click", async (event) => {
                    const status = countyStatusByFips.get(countyFips) || "inactive";
                    if (!overlayPrefs.showCounties || !isStatusVisible(status)) return;
                    try {
                        await openCountyPopup(countyFips, event.latlng);
                    } catch (err) {
                        await popupAlert(err.message || "Unable to load county details.", "Load Failed");
                    }
                });
            },
        }).addTo(map);
    }

    async function loadGeoOverlays() {
        if (!map || typeof topojson === "undefined") return;
        try {
            const [activePayload, statesTopo, countiesTopo] = await Promise.all([
                fetchJson("/api/map/overlays/active"),
                getStatesTopo(),
                getCountiesTopo(),
            ]);
            activeStateFips = new Set((activePayload.active_state_fips || []).map((v) => normalizeFips(v, 2)));
            countyStatusByFips = new Map();
            (activePayload.county_statuses || []).forEach((item) => {
                countyStatusByFips.set(normalizeFips(item.county_fips, 5), String(item.status || "inactive"));
            });

            const statesFeatures = topojson.feature(statesTopo, statesTopo.objects.states).features
                .filter((f) => activeStateFips.has(normalizeFips(f.id, 2)));
            const countyFeatures = topojson.feature(countiesTopo, countiesTopo.objects.counties).features
                .filter((f) => activeStateFips.has(normalizeFips(String(f.id).slice(0, 2), 2)));

            cachedStateFeatures = statesFeatures;
            cachedCountyFeatures = countyFeatures;
            renderOverlayLayers();
        } catch (err) {
            reportDebug(err, { source: "map_overlay_load" });
            console.warn("Map overlays failed to load.", err);
            removeOverlayLayers();
        }
    }

    window.GSIMap = {
        init() {
            const mapEl = document.getElementById("map");
            if (!mapEl) return;
            map = L.map("map", { zoomControl: true }).setView([39.5, -98.35], 4);
            map.createPane("stateOverlayPane");
            map.getPane("stateOverlayPane").style.zIndex = "420";
            map.createPane("countyOverlayPane");
            map.getPane("countyOverlayPane").style.zIndex = "430";
            loadOverlayPrefs();
            createOverlayControl();
            applyTheme(document.documentElement.getAttribute("data-bs-theme") || "dark");
            loadGeoOverlays();
            document.addEventListener("map:overlay-data-changed", loadGeoOverlays);
            document.addEventListener("module:overlay-opened", closeActiveCountyPopup);
        },
        resize() {
            if (!map) return;
            map.invalidateSize();
        },
        onThemeChanged(theme) {
            applyTheme(theme);
        },
        reloadOverlays() {
            loadGeoOverlays();
        }
    };
})();
