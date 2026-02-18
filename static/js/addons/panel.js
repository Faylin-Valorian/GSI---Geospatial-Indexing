(function () {
    function reportDebug(error, context = {}) {
        if (window.GSIDebug && typeof window.GSIDebug.reportError === "function") {
            window.GSIDebug.reportError(error, context);
        }
    }

    function csrfToken() {
        const meta = document.querySelector('meta[name="csrf-token"]');
        return meta ? meta.getAttribute("content") || "" : "";
    }

    async function api(path, method = "GET", payload = null) {
        const opts = { method, headers: { "Content-Type": "application/json" } };
        if (method !== "GET") opts.headers["X-CSRF-Token"] = csrfToken();
        if (payload !== null) opts.body = JSON.stringify(payload);

        const res = await fetch(path, opts);
        let data = {};
        try {
            data = await res.json();
        } catch (_) {}
        if (!res.ok || data.success === false) {
            const err = new Error(data.message || `Request failed (${res.status})`);
            reportDebug(err, { source: "addons_api", path, method, status: res.status });
            throw err;
        }
        return data;
    }

    function esc(v) {
        return String(v || "")
            .replaceAll("&", "&amp;")
            .replaceAll("<", "&lt;")
            .replaceAll(">", "&gt;");
    }

    const state = {
        allApps: [],
        apps: [],
        selectedAppId: null,
        activeGroup: "extra_tools",
        canManageOrder: false,
    };

    const GROUP_LABELS = {
        database_setup: "Database Setup",
        edata_setup: "eData Setup",
        keli_setup: "Keli Setup",
        processing_tools: "Processing Tools",
        edata_cleanup: "eData Cleanup",
        keli_linkup: "Keli Linkup",
        extra_tools: "App Add-ons",
    };

    function normalizeGroup(value) {
        const normalized = String(value || "")
            .trim()
            .toLowerCase()
            .replace(/[^a-z0-9_-]+/g, "_")
            .replace(/^[_-]+|[_-]+$/g, "");
        return normalized || "extra_tools";
    }

    function currentGroupLabel() {
        const fromApp = state.allApps.find((app) => normalizeGroup(app.nav_group) === state.activeGroup);
        if (fromApp && fromApp.nav_group_label) return String(fromApp.nav_group_label);
        return GROUP_LABELS[state.activeGroup] || state.activeGroup.replaceAll("_", " ");
    }

    function selectedApp() {
        return state.apps.find((x) => x.id === state.selectedAppId) || null;
    }

    function setBanner(message, kind = "info") {
        const root = document.getElementById("addonAppWorkspace");
        if (!root) return;
        root.setAttribute("data-banner-kind", kind);
        const existing = root.querySelector(".addons-banner");
        if (existing) existing.remove();
        const el = document.createElement("div");
        el.className = `addons-banner addons-banner-${kind}`;
        el.textContent = message;
        root.prepend(el);
    }

    function renderAppsList() {
        const list = document.getElementById("addonAppsList");
        const count = document.getElementById("addonAppsCount");
        const group = document.getElementById("addonAppsGroupLabel");
        if (!list || !count || !group) return;

        group.textContent = currentGroupLabel();
        count.textContent = `${state.apps.length} app(s) detected`;
        if (!state.apps.length) {
            list.innerHTML = `<div class="small text-muted">No app folders detected in \`apps\` for ${esc(currentGroupLabel())}.</div>`;
            return;
        }

        list.innerHTML = state.apps.map((app, idx) => {
            const controls = state.canManageOrder ? `
                <div class="addons-item-actions">
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-addon-move="up" data-addon-move-id="${esc(app.id)}" ${idx === 0 ? "disabled" : ""} title="Move up">
                        <i class="bi bi-arrow-up"></i>
                    </button>
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-addon-move="down" data-addon-move-id="${esc(app.id)}" ${idx === state.apps.length - 1 ? "disabled" : ""} title="Move down">
                        <i class="bi bi-arrow-down"></i>
                    </button>
                </div>
            ` : "";
            return `
                <div class="addons-item-row">
                    <button type="button" class="addons-item ${app.id === state.selectedAppId ? "active" : ""}" data-addon-app-id="${esc(app.id)}">
                        <div class="fw-semibold">${esc(app.title)}</div>
                    </button>
                    ${controls}
                </div>
            `;
        }).join("");
    }

    function renderHeader() {
        const app = selectedApp();
        const title = document.getElementById("addonAppTitle");
        const desc = document.getElementById("addonAppDescription");
        if (!title || !desc) return;

        if (!app) {
            title.textContent = "Select an app";
            desc.textContent = "Choose an app from the list to configure and run.";
            return;
        }

        title.textContent = app.title;
        desc.textContent = app.description;
    }

    function renderNetworkDriveApp(app) {
        const root = document.getElementById("addonAppWorkspace");
        if (!root) return;
        root.classList.remove("addons-empty-state");
        const defaultDrive = (app.default_drive_letter || "I").toUpperCase();
        const defaultTarget = app.default_network_target || "\\\\pagrape\\scanning";
        root.innerHTML = `
            <div class="row g-3">
                <div class="col-12">
                    <label class="form-label small text-muted">Target</label>
                    <div class="addons-target">${esc(app.network_label || "Network Drive")}</div>
                </div>
                <div class="col-md-3">
                    <label class="form-label" for="networkDriveLetter">Drive Letter</label>
                    <input id="networkDriveLetter" class="form-control text-uppercase" maxlength="1" placeholder="I" value="${esc(defaultDrive)}">
                </div>
                <div class="col-md-9">
                    <label class="form-label" for="networkDriveTarget">Network Target (UNC)</label>
                    <input id="networkDriveTarget" class="form-control" placeholder="\\\\server\\share" value="${esc(defaultTarget)}">
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="networkDriveUsername">Domain/User</label>
                    <input id="networkDriveUsername" class="form-control" autocomplete="username" placeholder="DOMAIN\\\\username or username">
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="networkDrivePassword">Password</label>
                    <input id="networkDrivePassword" class="form-control" type="password" autocomplete="current-password" placeholder="Enter network password">
                </div>
                <div class="col-12 d-flex flex-wrap gap-2">
                    <button id="networkDriveConnectBtn" class="btn btn-primary" type="button">
                        <i class="bi bi-plug-fill me-1"></i>Connect Drive
                    </button>
                    <button id="networkDriveDisconnectBtn" class="btn btn-outline-secondary" type="button">
                        <i class="bi bi-plug me-1"></i>Disconnect Drive
                    </button>
                </div>
            </div>
        `;

        const connectBtn = document.getElementById("networkDriveConnectBtn");
        const disconnectBtn = document.getElementById("networkDriveDisconnectBtn");
        const driveInput = document.getElementById("networkDriveLetter");
        const targetInput = document.getElementById("networkDriveTarget");
        const usernameInput = document.getElementById("networkDriveUsername");
        const passwordInput = document.getElementById("networkDrivePassword");
        if (!connectBtn || !disconnectBtn || !driveInput || !targetInput || !usernameInput || !passwordInput) return;

        connectBtn.addEventListener("click", async () => {
            connectBtn.disabled = true;
            try {
                const payload = await api(`/api/addons/apps/${encodeURIComponent(app.id)}/connect`, "POST", {
                    drive_letter: driveInput.value.trim().toUpperCase(),
                    network_target: targetInput.value.trim(),
                    username: usernameInput.value.trim(),
                    password: passwordInput.value,
                });
                setBanner(payload.message || "Connection command executed.", "success");
            } catch (err) {
                setBanner(err.message, "danger");
            } finally {
                connectBtn.disabled = false;
            }
        });

        disconnectBtn.addEventListener("click", async () => {
            disconnectBtn.disabled = true;
            try {
                const payload = await api(`/api/addons/apps/${encodeURIComponent(app.id)}/disconnect`, "POST", {
                    drive_letter: driveInput.value.trim().toUpperCase(),
                });
                setBanner(payload.message || "Disconnect command executed.", "success");
            } catch (err) {
                setBanner(err.message, "danger");
            } finally {
                disconnectBtn.disabled = false;
            }
        });
    }

    function renderCompatibilityApp(app) {
        const root = document.getElementById("addonAppWorkspace");
        if (!root) return;
        root.classList.remove("addons-empty-state");
        const defaultDb = app.default_database_name || "";
        const currentLevelRaw = Number(app.current_compatibility_level);
        const hasCurrentLevel = Number.isFinite(currentLevelRaw) && currentLevelRaw > 0;
        const minAllowedLevel = Math.max(130, hasCurrentLevel ? currentLevelRaw : 130);
        const options = Array.isArray(app.compatibility_options) ? app.compatibility_options : [];
        const fallbackOptions = [
            { level: 130, sql_server_version: "SQL Server 2016" },
            { level: 140, sql_server_version: "SQL Server 2017" },
            { level: 150, sql_server_version: "SQL Server 2019" },
            { level: 160, sql_server_version: "SQL Server 2022" },
        ];
        const sourceLevels = options.length ? options.slice() : fallbackOptions.slice();
        if (hasCurrentLevel && !sourceLevels.find((x) => Number(x.level) === currentLevelRaw)) {
            sourceLevels.push({ level: currentLevelRaw, sql_server_version: "Current Database Level" });
        }
        const levels = sourceLevels
            .filter((x) => Number(x.level) >= minAllowedLevel)
            .sort((a, b) => Number(a.level) - Number(b.level));
        const defaultSelectedLevel = hasCurrentLevel ? currentLevelRaw : 130;

        root.innerHTML = `
            <div class="row g-3">
                <div class="col-12">
                    <label class="form-label" for="compatibilityDatabaseName">Database Name</label>
                    <input id="compatibilityDatabaseName" class="form-control" value="${esc(defaultDb)}" placeholder="GSIEnterprise">
                </div>
                <div class="col-12">
                    <label class="form-label" for="compatibilityLevelSelect">Compatibility Level</label>
                    <select id="compatibilityLevelSelect" class="form-select">
                        ${levels.map((entry) => {
                            const level = Number(entry.level);
                            const version = String(entry.sql_server_version || "").trim();
                            return `<option value="${level}" ${level === defaultSelectedLevel ? "selected" : ""}>${level}${version ? ` - ${esc(version)}` : ""}</option>`;
                        }).join("")}
                    </select>
                    <div class="form-text">Minimum supported compatibility level is 130. You cannot select below the database's current compatibility level.</div>
                </div>
                <div class="col-12 d-flex flex-wrap gap-2">
                    <button id="compatibilityApplyBtn" class="btn btn-primary" type="button">
                        <i class="bi bi-sliders me-1"></i>Apply Compatibility
                    </button>
                </div>
            </div>
        `;

        const applyBtn = document.getElementById("compatibilityApplyBtn");
        const dbInput = document.getElementById("compatibilityDatabaseName");
        const levelSelect = document.getElementById("compatibilityLevelSelect");
        if (!applyBtn || !dbInput || !levelSelect) return;

        applyBtn.addEventListener("click", async () => {
            applyBtn.disabled = true;
            try {
                const payload = await api(`/api/addons/apps/${encodeURIComponent(app.id)}/change-compatibility`, "POST", {
                    database_name: dbInput.value.trim(),
                    compatibility_level: Number(levelSelect.value),
                });
                setBanner(payload.message || "Compatibility updated.", "success");
            } catch (err) {
                setBanner(err.message, "danger");
            } finally {
                applyBtn.disabled = false;
            }
        });
    }

    function renderAppWorkspace() {
        const app = selectedApp();
        const root = document.getElementById("addonAppWorkspace");
        if (!root) return;
        if (!app) {
            root.className = "addons-meta-card addons-empty-state";
            root.textContent = "Select an app to continue.";
            return;
        }

        if (app.type === "network_drive_connect") {
            renderNetworkDriveApp(app);
            return;
        }
        if (app.type === "change_database_compatibility") {
            renderCompatibilityApp(app);
            return;
        }

        root.className = "addons-meta-card addons-empty-state";
        root.textContent = `Unsupported app type: ${app.type}`;
    }

    function renderAll() {
        renderAppsList();
        renderHeader();
        renderAppWorkspace();
    }

    async function persistCurrentGroupOrder() {
        if (!state.canManageOrder) return;
        const orderedIds = state.apps.map((app) => app.id);
        await api("/api/addons/apps/order", "POST", {
            group: state.activeGroup,
            app_ids: orderedIds,
        });
    }

    function moveApp(appId, direction) {
        if (!state.canManageOrder) return;
        const idx = state.apps.findIndex((a) => a.id === appId);
        if (idx < 0) return;
        const targetIdx = direction === "up" ? idx - 1 : idx + 1;
        if (targetIdx < 0 || targetIdx >= state.apps.length) return;

        const nextApps = state.apps.slice();
        const temp = nextApps[idx];
        nextApps[idx] = nextApps[targetIdx];
        nextApps[targetIdx] = temp;
        state.apps = nextApps;

        const queue = nextApps.slice();
        state.allApps = state.allApps.map((app) =>
            normalizeGroup(app.nav_group) === state.activeGroup ? queue.shift() || app : app
        );

        renderAll();
        persistCurrentGroupOrder().catch((err) => setBanner(err.message, "danger"));
    }

    function selectApp(id) {
        state.selectedAppId = id;
        renderAll();
    }

    function applyActiveGroup(groupKey) {
        state.activeGroup = normalizeGroup(groupKey || state.activeGroup || "extra_tools");
        state.apps = state.allApps.filter((app) => normalizeGroup(app.nav_group) === state.activeGroup);
        if (!state.apps.find((a) => a.id === state.selectedAppId)) {
            state.selectedAppId = state.apps.length ? state.apps[0].id : null;
        }
        renderAll();
    }

    async function loadApps() {
        const payload = await api("/api/addons/apps");
        state.canManageOrder = Boolean(payload.can_manage_order);
        state.allApps = payload.apps || [];
        applyActiveGroup(state.activeGroup);
    }

    function bindEvents() {
        const list = document.getElementById("addonAppsList");
        if (list) {
            list.addEventListener("click", (event) => {
                const moveBtn = event.target.closest("[data-addon-move]");
                if (moveBtn) {
                    event.preventDefault();
                    moveApp(
                        moveBtn.getAttribute("data-addon-move-id"),
                        moveBtn.getAttribute("data-addon-move")
                    );
                    return;
                }
                const btn = event.target.closest("[data-addon-app-id]");
                if (!btn) return;
                selectApp(btn.getAttribute("data-addon-app-id"));
            });
        }

        const refreshBtn = document.getElementById("addonAppsRefreshBtn");
        if (refreshBtn) {
            refreshBtn.addEventListener("click", async () => {
                refreshBtn.disabled = true;
                try {
                    await loadApps();
                } catch (err) {
                    const root = document.getElementById("addonAppWorkspace");
                    if (root) {
                        root.className = "addons-meta-card addons-empty-state";
                        root.textContent = `Failed to load apps: ${err.message}`;
                    }
                } finally {
                    refreshBtn.disabled = false;
                }
            });
        }
    }

    window.GSIAddonsPanel = {
        init() {
            if (!document.getElementById("addonAppsList")) return;
            bindEvents();
            document.addEventListener("addons:open-group", (event) => {
                const group = event && event.detail ? event.detail.group : "extra_tools";
                applyActiveGroup(group);
            });
            document.addEventListener("runtime:settings-changed", () => {
                loadApps().catch((err) => {
                    const root = document.getElementById("addonAppWorkspace");
                    if (root) {
                        root.className = "addons-meta-card addons-empty-state";
                        root.textContent = `Failed to load apps: ${err.message}`;
                    }
                });
            });
            loadApps().catch((err) => {
                const root = document.getElementById("addonAppWorkspace");
                if (root) {
                    root.className = "addons-meta-card addons-empty-state";
                    root.textContent = `Failed to load apps: ${err.message}`;
                }
            });
        },
    };
})();
