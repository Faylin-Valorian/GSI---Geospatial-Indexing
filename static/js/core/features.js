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

    window.GSICore = {
        csrfToken,
        apiJson,
        reportError,
        isDebugEnabled() {
            return !!(window.GSIDebug && typeof window.GSIDebug.isEnabled === "function" && window.GSIDebug.isEnabled());
        },
    };
})();
