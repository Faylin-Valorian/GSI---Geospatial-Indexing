(function () {
    function csrfToken() {
        const meta = document.querySelector('meta[name="csrf-token"]');
        return meta ? meta.getAttribute("content") || "" : "";
    }

    async function apiJson(path, options = {}) {
        const method = String(options.method || "GET").toUpperCase();
        const headers = Object.assign({}, options.headers || {});
        const payload = options.payload;
        const context = Object.assign({}, options.context || {});

        if (!headers["Content-Type"] && payload !== undefined) {
            headers["Content-Type"] = "application/json";
        }
        if (method !== "GET" && !headers["X-CSRF-Token"]) {
            headers["X-CSRF-Token"] = csrfToken();
        }

        const fetchOpts = {
            method,
            headers,
        };
        if (payload !== undefined) {
            fetchOpts.body = typeof payload === "string" ? payload : JSON.stringify(payload);
        }

        try {
            const res = await fetch(path, fetchOpts);
            let data = null;
            try {
                data = await res.json();
            } catch (_) {}
            if (!res.ok || (data && data.success === false)) {
                const msg = (data && data.message) || `Request failed (${res.status})`;
                const err = new Error(msg);
                if (window.GSIDebug && typeof window.GSIDebug.reportError === "function") {
                    window.GSIDebug.reportError(err, Object.assign({
                        source: "core_api",
                        path,
                        method,
                        status: res.status,
                    }, context));
                }
                throw err;
            }
            return data;
        } catch (err) {
            if (window.GSIDebug && typeof window.GSIDebug.reportError === "function") {
                window.GSIDebug.reportError(err, Object.assign({
                    source: "core_api_transport",
                    path,
                    method,
                }, context));
            }
            throw err;
        }
    }

    function reportError(error, context = {}) {
        if (window.GSIDebug && typeof window.GSIDebug.reportError === "function") {
            window.GSIDebug.reportError(error, context);
        }
    }

    function popupAlert(message, options = {}) {
        if (window.GSIPopup && typeof window.GSIPopup.alert === "function") {
            return window.GSIPopup.alert({ message, ...options });
        }
        window.alert(message);
        return Promise.resolve(true);
    }

    function popupConfirm(message, options = {}) {
        if (window.GSIPopup && typeof window.GSIPopup.confirm === "function") {
            return window.GSIPopup.confirm({ message, ...options });
        }
        return Promise.resolve(window.confirm(message));
    }

    function popupPrompt(message, options = {}) {
        if (window.GSIPopup && typeof window.GSIPopup.prompt === "function") {
            return window.GSIPopup.prompt({ message, ...options });
        }
        const value = window.prompt(message, options.defaultValue || "");
        return Promise.resolve(value);
    }

    function imageStreamUrl(source, path) {
        if (window.GSIImageViewer && typeof window.GSIImageViewer.buildStreamUrl === "function") {
            return window.GSIImageViewer.buildStreamUrl(source, path);
        }
        const sourceKey = String(source || "").trim();
        const relativePath = String(path || "").trim();
        if (!sourceKey || !relativePath) return "";
        return `/api/images/stream?source=${encodeURIComponent(sourceKey)}&path=${encodeURIComponent(relativePath)}`;
    }

    function openImageViewer(options = {}) {
        if (window.GSIImageViewer) {
            if (options && options.source && options.path && typeof window.GSIImageViewer.openFromStream === "function") {
                window.GSIImageViewer.openFromStream(options);
                return;
            }
            if (typeof window.GSIImageViewer.open === "function") {
                window.GSIImageViewer.open(options);
                return;
            }
        }
        if (options && options.src) {
            window.open(String(options.src), "_blank", "noopener,noreferrer");
            return;
        }
        if (options && options.source && options.path) {
            const url = imageStreamUrl(options.source, options.path);
            if (url) window.open(url, "_blank", "noopener,noreferrer");
        }
    }

    window.GSICore = {
        csrfToken,
        apiJson,
        reportError,
        popupAlert,
        popupConfirm,
        popupPrompt,
        imageStreamUrl,
        openImageViewer,
        isDebugEnabled() {
            return !!(window.GSIDebug && typeof window.GSIDebug.isEnabled === "function" && window.GSIDebug.isEnabled());
        },
    };
})();
