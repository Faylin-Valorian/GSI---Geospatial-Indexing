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

    let lastPopupSignature = "";
    let lastPopupAt = 0;

    async function show(details) {
        const now = Date.now();
        if (details === lastPopupSignature && now - lastPopupAt < 2000) {
            return;
        }
        lastPopupSignature = details;
        lastPopupAt = now;

        if (window.GSIPopup && typeof window.GSIPopup.alert === "function") {
            await window.GSIPopup.alert({
                title: "Debug Error",
                message: details,
                confirmText: "Close",
                copyText: details,
                copyLabel: "Copy Error",
            });
            return;
        }
        console.error("Debug Error:", details);
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
            show(details).catch(() => {});
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
        },
        reportError,
    };
})();
