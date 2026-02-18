(function () {
    let geoStatesCache = [];

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
        if (method !== "GET") {
            opts.headers["X-CSRF-Token"] = csrfToken();
        }
        if (payload !== null) opts.body = JSON.stringify(payload);
        const res = await fetch(path, opts);
        if (!res.ok) {
            let msg = `Request failed (${res.status})`;
            try {
                const data = await res.json();
                if (data.message) msg = data.message;
            } catch (_) {}
            reportDebug(new Error(msg), { source: "admin_api", path, method, status: res.status });
            throw new Error(msg);
        }
        return res.json();
    }

    function badge(value, yes = "Yes", no = "No") {
        return `<span class="badge ${value ? "bg-success" : "bg-secondary"}">${value ? yes : no}</span>`;
    }

    async function loadUsers() {
        const rows = await api("/admin/api/users");
        const body = document.getElementById("adminUsersBody");
        if (!body) return;

        body.innerHTML = rows.map((u) => {
            const roleBtn = `<button class="btn btn-sm ${u.role === "admin" ? "btn-warning" : "btn-outline-secondary"}" data-action="role" data-id="${u.id}" data-role="${u.role === "admin" ? "user" : "admin"}">${u.role === "admin" ? "Demote" : "Promote"}</button>`;
            const activeBtn = `<button class="btn btn-sm ${u.is_active ? "btn-outline-danger" : "btn-outline-success"}" data-action="active" data-id="${u.id}" data-value="${!u.is_active}">${u.is_active ? "Deactivate" : "Activate"}</button>`;
            const verifyBtn = `<button class="btn btn-sm ${u.is_verified ? "btn-outline-secondary" : "btn-outline-info"}" data-action="verify" data-id="${u.id}" data-value="${!u.is_verified}">${u.is_verified ? "Unverify" : "Verify"}</button>`;
            const resetBtn = `<button class="btn btn-sm btn-outline-primary" data-action="reset" data-id="${u.id}">Reset Password</button>`;

            return `<tr>
                <td>${u.username}</td>
                <td>${u.email}</td>
                <td>${u.role}</td>
                <td>${badge(u.is_active, "Active", "Inactive")}</td>
                <td>${badge(u.is_verified, "Verified", "Pending")}</td>
                <td class="d-flex flex-wrap gap-1">${roleBtn}${activeBtn}${verifyBtn}${resetBtn}</td>
            </tr>`;
        }).join("");
    }

    async function loadDomains() {
        const payload = await api("/admin/api/domains");

        const toggle = document.getElementById("restrictDomainsToggle");
        if (toggle) toggle.checked = payload.restrict_enabled;

        const body = document.getElementById("domainPolicyBody");
        if (!body) return;

        body.innerHTML = payload.domains.map((d) => {
            const toggleBtn = `<button class="btn btn-sm ${d.is_enabled ? "btn-outline-warning" : "btn-outline-success"}" data-action="toggle-domain" data-id="${d.id}" data-value="${!d.is_enabled}">${d.is_enabled ? "Disable" : "Enable"}</button>`;
            const deleteBtn = `<button class="btn btn-sm btn-outline-danger" data-action="delete-domain" data-id="${d.id}">Delete</button>`;
            return `<tr>
                <td>${d.domain}</td>
                <td>${badge(d.is_enabled, "Enabled", "Disabled")}</td>
                <td class="d-flex gap-1">${toggleBtn}${deleteBtn}</td>
            </tr>`;
        }).join("");
    }

    async function loadEmailSettings() {
        const payload = await api("/admin/api/email-settings");
        const input = document.getElementById("verificationFromInput");
        const status = document.getElementById("verificationFromStatus");
        if (input) input.value = payload.verification_from_email || "";
        if (status) {
            status.textContent = payload.verification_from_email
                ? `Current sender: ${payload.verification_from_email}`
                : "No sender override set. Falls back to SMTP_FROM configuration.";
        }
    }

    async function loadAdminSettings() {
        const payload = await api("/admin/api/settings");
        const showAdminPropertiesToggle = document.getElementById("showAdminPropertiesToggle");
        const debugModeToggle = document.getElementById("debugModeToggle");
        const status = document.getElementById("adminSettingsStatus");
        if (showAdminPropertiesToggle) showAdminPropertiesToggle.checked = !!payload.show_admin_properties;
        if (debugModeToggle) debugModeToggle.checked = !!payload.debug_mode;
        if (status) {
            status.textContent = "Settings loaded.";
        }
    }

    async function loadImageSources() {
        const rows = await api("/admin/api/image-sources");
        const body = document.getElementById("imageSourcesBody");
        if (!body) return;

        body.innerHTML = rows.map((s) => {
            const toggleBtn = `<button class="btn btn-sm ${s.is_enabled ? "btn-outline-warning" : "btn-outline-success"}" data-action="toggle-image-source" data-id="${s.id}" data-value="${!s.is_enabled}">${s.is_enabled ? "Disable" : "Enable"}</button>`;
            const deleteBtn = `<button class="btn btn-sm btn-outline-danger" data-action="delete-image-source" data-id="${s.id}">Delete</button>`;
            return `<tr>
                <td><code>${s.source_key}</code></td>
                <td><code>${s.root_path}</code></td>
                <td>${badge(s.is_enabled, "Enabled", "Disabled")}</td>
                <td class="d-flex gap-1">${toggleBtn}${deleteBtn}</td>
            </tr>`;
        }).join("");
    }

    async function loadAccessControls() {
        const rows = await api("/admin/api/access-controls");
        const body = document.getElementById("accessControlBody");
        if (!body) return;

        body.innerHTML = rows.map((r) => `
            <tr>
                <td>${r.role}</td>
                <td>${r.module_key}</td>
                <td>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" data-action="access" data-role="${r.role}" data-module="${r.module_key}" ${r.can_access ? "checked" : ""}>
                    </div>
                </td>
            </tr>
        `).join("");
    }

    async function loadUserAccessOverrides() {
        const rows = await api("/admin/api/user-access-overrides");
        const body = document.getElementById("userAccessOverridesBody");
        if (!body) return;
        body.innerHTML = rows.map((r) => `
            <tr>
                <td>${r.user_id}</td>
                <td>${r.username}</td>
                <td>${r.email}</td>
                <td>${r.module_key}</td>
                <td>${badge(r.can_access, "Allow", "Deny")}</td>
            </tr>
        `).join("");
    }

    async function loadGeoStates() {
        const rows = await api("/admin/api/geography/states");
        geoStatesCache = Array.isArray(rows) ? rows : [];
        const body = document.getElementById("geoStatesBody");
        const countyFilterStateSelect = document.getElementById("geoCountyFilterStateSelect");

        if (countyFilterStateSelect) {
            countyFilterStateSelect.innerHTML = [
                '<option value="">All states</option>',
                ...geoStatesCache
                    .filter((s) => !!s.is_active)
                    .map((s) => `<option value="${s.state_fips}">${s.state_name}</option>`),
            ].join("");
        }
        if (!body) return;

        body.innerHTML = geoStatesCache.map((s) => `
            <tr>
                <td>${s.state_name}</td>
                <td>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" data-action="geo-state-active" data-fips="${s.state_fips}" ${s.is_active ? "checked" : ""}>
                    </div>
                </td>
            </tr>
        `).join("");
    }

    async function loadGeoCounties(stateFips = "") {
        const query = stateFips ? `?state_fips=${encodeURIComponent(stateFips)}` : "";
        const rows = await api(`/admin/api/geography/counties${query}`);
        const body = document.getElementById("geoCountiesBody");
        if (!body) return;

        body.innerHTML = rows.map((c) => `
            <tr>
                <td>${c.county_name}</td>
                <td>${c.state_name}</td>
                <td>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" data-action="geo-county-active" data-fips="${c.county_fips}" ${c.is_active ? "checked" : ""}>
                    </div>
                </td>
                <td>
                    <button
                        class="btn btn-sm btn-outline-secondary"
                        data-action="geo-county-active-job"
                        data-fips="${c.county_fips}"
                        data-value="${c.is_active_job ? "false" : "true"}"
                        ${!c.is_active ? "disabled" : ""}
                    >
                        ${c.is_active_job ? "Close Active Job" : "Mark For Active Job"}
                    </button>
                </td>
            </tr>
        `).join("");
    }

    async function initialize() {
        await Promise.all([
            loadUsers(),
            loadDomains(),
            loadEmailSettings(),
            loadAdminSettings(),
            loadImageSources(),
            loadAccessControls(),
            loadUserAccessOverrides(),
            loadGeoStates(),
        ]);
        await loadGeoCounties();

        document.body.addEventListener("click", async (event) => {
            const target = event.target.closest("button");
            if (!target) return;
            const action = target.dataset.action;
            if (!action) return;

            try {
                if (action === "role") {
                    await api(`/admin/api/users/${target.dataset.id}/role`, "POST", { role: target.dataset.role });
                    await loadUsers();
                }
                if (action === "active") {
                    await api(`/admin/api/users/${target.dataset.id}/status`, "POST", { is_active: target.dataset.value === "true" });
                    await loadUsers();
                }
                if (action === "verify") {
                    await api(`/admin/api/users/${target.dataset.id}/verify`, "POST", { is_verified: target.dataset.value === "true" });
                    await loadUsers();
                }
                if (action === "reset") {
                    const newPassword = window.prompt("Enter a new password (minimum 12 characters):", "");
                    if (!newPassword) return;
                    const confirmPassword = window.prompt("Re-enter the new password:", "");
                    if (newPassword !== confirmPassword) {
                        alert("Passwords do not match.");
                        return;
                    }
                    await api(`/admin/api/users/${target.dataset.id}/reset-password`, "POST", { new_password: newPassword });
                    alert("Password updated.");
                }
                if (action === "toggle-domain") {
                    await api(`/admin/api/domains/${target.dataset.id}/toggle`, "POST", { is_enabled: target.dataset.value === "true" });
                    await loadDomains();
                }
                if (action === "delete-domain") {
                    await api(`/admin/api/domains/${target.dataset.id}`, "DELETE");
                    await loadDomains();
                }
                if (action === "toggle-image-source") {
                    await api(`/admin/api/image-sources/${target.dataset.id}/toggle`, "POST", { is_enabled: target.dataset.value === "true" });
                    await loadImageSources();
                }
                if (action === "delete-image-source") {
                    await api(`/admin/api/image-sources/${target.dataset.id}`, "DELETE");
                    await loadImageSources();
                }
                if (action === "geo-county-filter") {
                    const input = document.getElementById("geoCountyFilterStateSelect");
                    await loadGeoCounties(input ? input.value.trim() : "");
                }
                if (action === "geo-county-active-job") {
                    const enable = target.dataset.value === "true";
                    await api(`/admin/api/geography/counties/${target.dataset.fips}/active-job`, "POST", {
                        is_active_job: enable,
                    });
                    const input = document.getElementById("geoCountyFilterStateSelect");
                    await loadGeoCounties(input ? input.value.trim() : "");
                    document.dispatchEvent(new Event("map:overlay-data-changed"));
                }
            } catch (err) {
                alert(err.message);
            }
        });

        document.body.addEventListener("change", async (event) => {
            const target = event.target;
            if (!(target instanceof HTMLInputElement) && !(target instanceof HTMLSelectElement)) return;

            try {
                if (target.id === "restrictDomainsToggle") {
                    await api("/admin/api/domains/restriction", "POST", { enabled: target.checked });
                }
                if (target.id === "geoCountyFilterStateSelect") {
                    await loadGeoCounties(target.value.trim());
                }
                if (target.dataset.action === "access") {
                    await api("/admin/api/access-controls", "POST", {
                        role: target.dataset.role,
                        module_key: target.dataset.module,
                        can_access: target.checked,
                    });
                }
                if (target.dataset.action === "geo-state-active") {
                    await api(`/admin/api/geography/states/${target.dataset.fips}/toggle`, "POST", {
                        is_active: target.checked,
                    });
                    await loadGeoStates();
                    const activeFilter = document.getElementById("geoCountyFilterStateSelect");
                    await loadGeoCounties(activeFilter ? activeFilter.value.trim() : "");
                    document.dispatchEvent(new Event("map:overlay-data-changed"));
                }
                if (target.dataset.action === "geo-county-active") {
                    await api(`/admin/api/geography/counties/${target.dataset.fips}/toggle`, "POST", {
                        is_active: target.checked,
                    });
                    document.dispatchEvent(new Event("map:overlay-data-changed"));
                }
            } catch (err) {
                alert(err.message);
            }
        });

        const saveUserAccessOverrideBtn = document.getElementById("saveUserAccessOverrideBtn");
        if (saveUserAccessOverrideBtn) {
            saveUserAccessOverrideBtn.addEventListener("click", async () => {
                const userIdInput = document.getElementById("userAccessUserId");
                const moduleInput = document.getElementById("userAccessModuleKey");
                const allowInput = document.getElementById("userAccessCanAccess");
                if (!userIdInput || !moduleInput || !allowInput) return;

                const userId = parseInt(userIdInput.value, 10);
                const moduleKey = moduleInput.value.trim();
                const canAccess = allowInput.value === "1";
                if (!userId || !moduleKey) return;

                try {
                    await api("/admin/api/user-access-overrides", "POST", {
                        user_id: userId,
                        module_key: moduleKey,
                        can_access: canAccess,
                    });
                    moduleInput.value = "";
                    await loadUserAccessOverrides();
                } catch (err) {
                    alert(err.message);
                }
            });
        }

        const addDomainBtn = document.getElementById("addDomainBtn");
        if (addDomainBtn) {
            addDomainBtn.addEventListener("click", async () => {
                const input = document.getElementById("newDomainInput");
                if (!input) return;
                const domain = input.value.trim().toLowerCase();
                if (!domain) return;
                try {
                    await api("/admin/api/domains", "POST", { domain });
                    input.value = "";
                    await loadDomains();
                } catch (err) {
                    alert(err.message);
                }
            });
        }

        const saveVerificationFromBtn = document.getElementById("saveVerificationFromBtn");
        if (saveVerificationFromBtn) {
            saveVerificationFromBtn.addEventListener("click", async () => {
                const input = document.getElementById("verificationFromInput");
                const status = document.getElementById("verificationFromStatus");
                if (!input) return;

                try {
                    await api("/admin/api/email-settings", "POST", {
                        verification_from_email: input.value.trim(),
                    });
                    if (status) status.textContent = "Sender address saved.";
                    await loadEmailSettings();
                } catch (err) {
                    if (status) status.textContent = err.message;
                }
            });
        }

        const addImageSourceBtn = document.getElementById("addImageSourceBtn");
        if (addImageSourceBtn) {
            addImageSourceBtn.addEventListener("click", async () => {
                const keyInput = document.getElementById("imageSourceKeyInput");
                const rootInput = document.getElementById("imageSourceRootInput");
                if (!keyInput || !rootInput) return;

                const sourceKey = keyInput.value.trim().toLowerCase();
                const rootPath = rootInput.value.trim();
                if (!sourceKey || !rootPath) return;

                try {
                    await api("/admin/api/image-sources", "POST", {
                        source_key: sourceKey,
                        root_path: rootPath,
                    });
                    keyInput.value = "";
                    rootInput.value = "";
                    await loadImageSources();
                } catch (err) {
                    alert(err.message);
                }
            });
        }

        const geoCountyFilterBtn = document.getElementById("geoCountyFilterBtn");
        if (geoCountyFilterBtn) {
            geoCountyFilterBtn.dataset.action = "geo-county-filter";
        }

        const saveAdminSettingsBtn = document.getElementById("saveAdminSettingsBtn");
        if (saveAdminSettingsBtn) {
            saveAdminSettingsBtn.addEventListener("click", async () => {
                const showAdminPropertiesToggle = document.getElementById("showAdminPropertiesToggle");
                const debugModeToggle = document.getElementById("debugModeToggle");
                const status = document.getElementById("adminSettingsStatus");
                if (!showAdminPropertiesToggle || !debugModeToggle) return;
                saveAdminSettingsBtn.disabled = true;
                try {
                    await api("/admin/api/settings", "POST", {
                        show_admin_properties: showAdminPropertiesToggle.checked,
                        debug_mode: debugModeToggle.checked,
                    });
                    if (window.GSIDebug && typeof window.GSIDebug.setEnabled === "function") {
                        window.GSIDebug.setEnabled(debugModeToggle.checked);
                    }
                    document.dispatchEvent(
                        new CustomEvent("runtime:settings-changed", {
                            detail: {
                                show_admin_properties: showAdminPropertiesToggle.checked,
                                debug_mode: debugModeToggle.checked,
                            },
                        })
                    );
                    if (status) status.textContent = "Settings saved.";
                } catch (err) {
                    if (status) status.textContent = err.message;
                } finally {
                    saveAdminSettingsBtn.disabled = false;
                }
            });
        }

    }

    document.addEventListener("DOMContentLoaded", () => {
        if (document.getElementById("adminUsersBody")) {
            initialize().catch((err) => alert(err.message));
        }
    });
})();
