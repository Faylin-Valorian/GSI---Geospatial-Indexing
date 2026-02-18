(function () {
    const queue = [];
    let active = false;
    let root = null;

    function ensureRoot() {
        if (root) return root;
        root = document.createElement("div");
        root.className = "gsi-popup-backdrop";
        root.id = "gsiPopupBackdrop";
        root.innerHTML = `
            <div class="gsi-popup-card" role="dialog" aria-modal="true" aria-live="polite">
                <header class="gsi-popup-head">
                    <h3 class="gsi-popup-title" id="gsiPopupTitle">Notice</h3>
                </header>
                <section class="gsi-popup-body">
                    <p class="gsi-popup-message" id="gsiPopupMessage"></p>
                    <div class="gsi-popup-input-wrap" id="gsiPopupInputWrap" style="display:none;">
                        <input id="gsiPopupInput" class="form-control" />
                    </div>
                </section>
                <footer class="gsi-popup-actions" id="gsiPopupActions"></footer>
            </div>
        `;
        document.body.appendChild(root);
        return root;
    }

    function esc(v) {
        return String(v || "")
            .replaceAll("&", "&amp;")
            .replaceAll("<", "&lt;")
            .replaceAll(">", "&gt;");
    }

    function enqueue(kind, options) {
        return new Promise((resolve) => {
            queue.push({ kind, options: options || {}, resolve });
            processQueue();
        });
    }

    function close(resolve, value) {
        if (!root) return;
        root.classList.remove("is-open");
        active = false;
        resolve(value);
        window.setTimeout(processQueue, 0);
    }

    function processQueue() {
        if (active) return;
        const next = queue.shift();
        if (!next) return;
        active = true;

        const { kind, options, resolve } = next;
        const modal = ensureRoot();
        const titleEl = document.getElementById("gsiPopupTitle");
        const messageEl = document.getElementById("gsiPopupMessage");
        const actionsEl = document.getElementById("gsiPopupActions");
        const inputWrap = document.getElementById("gsiPopupInputWrap");
        const inputEl = document.getElementById("gsiPopupInput");
        if (!titleEl || !messageEl || !actionsEl || !inputWrap || !inputEl) {
            close(resolve, kind === "confirm" ? false : null);
            return;
        }

        const title = options.title || (kind === "confirm" ? "Confirm" : kind === "prompt" ? "Input Required" : "Notice");
        const message = options.message || "";
        titleEl.textContent = title;
        messageEl.innerHTML = esc(message);

        inputWrap.style.display = kind === "prompt" ? "block" : "none";
        inputEl.value = kind === "prompt" ? String(options.defaultValue || "") : "";
        inputEl.type = kind === "prompt" && options.inputType === "password" ? "password" : "text";
        inputEl.placeholder = kind === "prompt" ? String(options.placeholder || "") : "";

        const cancelText = String(options.cancelText || "Cancel");
        const okText = String(options.confirmText || "OK");

        if (kind === "alert") {
            const copyPayload = String(options.copyText || "");
            const copyLabel = String(options.copyLabel || "Copy");
            const copyBtn = copyPayload
                ? `<button type="button" class="btn btn-outline-secondary" data-popup-action="copy">${esc(copyLabel)}</button>`
                : "";
            actionsEl.innerHTML = `${copyBtn}<button type="button" class="btn btn-primary" data-popup-action="ok">${esc(okText)}</button>`;
        } else {
            actionsEl.innerHTML = `
                <button type="button" class="btn btn-outline-secondary" data-popup-action="cancel">${esc(cancelText)}</button>
                <button type="button" class="btn btn-primary" data-popup-action="ok">${esc(okText)}</button>
            `;
        }

        function onBackdropClick(event) {
            if (event.target !== modal) return;
            if (kind === "alert") return;
            cleanup();
            close(resolve, kind === "confirm" ? false : null);
        }

        function onKeydown(event) {
            if (event.key === "Escape") {
                if (kind === "alert") return;
                event.preventDefault();
                cleanup();
                close(resolve, kind === "confirm" ? false : null);
            }
            if (event.key === "Enter") {
                const activeTag = (document.activeElement && document.activeElement.tagName || "").toLowerCase();
                if (kind === "prompt" && activeTag === "input") {
                    event.preventDefault();
                    cleanup();
                    close(resolve, inputEl.value);
                }
            }
        }

        function onActionClick(event) {
            const btn = event.target.closest("[data-popup-action]");
            if (!btn) return;
            const action = btn.getAttribute("data-popup-action");
            if (action === "copy") {
                const copyPayload = String(options.copyText || "");
                if (copyPayload) {
                    copyText(copyPayload).catch(() => {});
                }
                return;
            }
            cleanup();
            if (action === "cancel") {
                close(resolve, kind === "confirm" ? false : null);
                return;
            }
            if (kind === "confirm") {
                close(resolve, true);
                return;
            }
            if (kind === "prompt") {
                close(resolve, inputEl.value);
                return;
            }
            close(resolve, true);
        }

        function cleanup() {
            modal.removeEventListener("click", onBackdropClick);
            actionsEl.removeEventListener("click", onActionClick);
            document.removeEventListener("keydown", onKeydown);
        }

        modal.addEventListener("click", onBackdropClick);
        actionsEl.addEventListener("click", onActionClick);
        document.addEventListener("keydown", onKeydown);
        modal.classList.add("is-open");

        window.setTimeout(() => {
            if (kind === "prompt") inputEl.focus();
            else {
                const okBtn = actionsEl.querySelector('[data-popup-action="ok"]');
                if (okBtn) okBtn.focus();
            }
        }, 0);
    }

    window.GSIPopup = {
        alert(options = {}) {
            return enqueue("alert", options);
        },
        confirm(options = {}) {
            return enqueue("confirm", options);
        },
        prompt(options = {}) {
            return enqueue("prompt", options);
        },
    };
})();
