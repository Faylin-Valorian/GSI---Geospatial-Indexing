(function () {
    const runtime = window.GSIRuntimeSettings || {};
    const state = {
        enabled: !!runtime.debug_mode,
    };

    function csrfToken() {
        const meta = document.querySelector('meta[name="csrf-token"]');
        return meta ? meta.getAttribute("content") || "" : "";
    }

    function normalizeError(error) {
        if (!error) return { message: "Unknown error", stack: "" };
        if (error instanceof Error) {
            return {
                message: String(error.message || "Error"),
                stack: String(error.stack || ""),
            };
        }
        return {
            message: String(error),
            stack: "",
        };
    }

    function buildDetails(error, context) {
        const e = normalizeError(error);
        const ctx = context && typeof context === "object" ? context : {};
        const now = new Date().toISOString();
        return [
            `Time: ${now}`,
            `Message: ${e.message}`,
            `Context: ${JSON.stringify(ctx)}`,
            `Path: ${window.location.pathname}`,
            e.stack ? `Stack:\n${e.stack}` : "Stack: (none)",
        ].join("\n");
    }

    async function copyText(text) {
        if (navigator.clipboard && navigator.clipboard.writeText) {
            await navigator.clipboard.writeText(text);
            return;
        }
        const temp = document.createElement("textarea");
        temp.value = text;
        document.body.appendChild(temp);
        temp.select();
        document.execCommand("copy");
        temp.remove();
    }

    function ensureToast() {
        let root = document.getElementById("debugToast");
        if (root) return root;
        root = document.createElement("div");
        root.id = "debugToast";
        root.className = "debug-toast";
        root.style.display = "none";
        root.innerHTML = `
            <div class="debug-toast-head">
                <div class="debug-toast-title">Debug Error</div>
                <button type="button" class="btn btn-sm btn-outline-light" data-debug-close>Close</button>
            </div>
            <div class="debug-toast-body" id="debugToastBody"></div>
            <div class="debug-toast-actions">
                <button type="button" class="btn btn-sm btn-outline-light" data-debug-copy>Copy Error</button>
            </div>
        `;
        document.body.appendChild(root);
        root.querySelector("[data-debug-close]").addEventListener("click", () => {
            root.style.display = "none";
        });
        root.querySelector("[data-debug-copy]").addEventListener("click", async () => {
            const body = document.getElementById("debugToastBody");
            if (!body) return;
            try {
                await copyText(body.textContent || "");
            } catch (_) {}
        });
        return root;
    }

    function show(details) {
        const root = ensureToast();
        const body = document.getElementById("debugToastBody");
        if (body) body.textContent = details;
        root.style.display = "block";
    }

    async function logClientError(error, context) {
        try {
            const normalized = normalizeError(error);
            await fetch("/api/debug/client-error", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "X-CSRF-Token": csrfToken(),
                },
                body: JSON.stringify({
                    error_type: String((context && context.source) || "ClientError"),
                    error_message: normalized.message,
                    stack_trace: buildDetails(error, context),
                    path: window.location.pathname,
                    method: "CLIENT",
                }),
            });
        } catch (_) {}
    }

    function reportError(error, context = {}) {
        const details = buildDetails(error, context);
        if (state.enabled) {
            show(details);
        }
        logClientError(error, context);
    }

    window.addEventListener("error", (event) => {
        reportError(event.error || event.message || "Unhandled error", {
            source: "window_error",
            file: event.filename,
            line: event.lineno,
            column: event.colno,
        });
    });

    window.addEventListener("unhandledrejection", (event) => {
        reportError(event.reason || "Unhandled rejection", {
            source: "unhandled_rejection",
        });
    });

    window.GSIDebug = {
        isEnabled() {
            return state.enabled;
        },
        setEnabled(enabled) {
            state.enabled = !!enabled;
            if (!state.enabled) {
                const root = document.getElementById("debugToast");
                if (root) root.style.display = "none";
            }
        },
        reportError,
    };
})();
