(function () {
    let activeOverlayId = null;

    function isDesktop() {
        return window.matchMedia("(min-width: 992px)").matches;
    }

    function findOpenPanelRightEdge() {
        if (!isDesktop()) return 66;
        const panel = document.querySelector(".menu-panel.open");
        if (!panel) return 66;
        const rect = panel.getBoundingClientRect();
        if (rect.width <= 1) return 66;
        return Math.max(66, Math.round(rect.right + 8));
    }

    function resetOverlayPosition(overlay) {
        overlay.style.left = "";
        overlay.style.right = "";
        overlay.style.top = "";
        overlay.style.bottom = "";
        overlay.style.width = "";
        overlay.style.height = "";
    }

    function applyMaximizedBounds(overlay) {
        if (!overlay.classList.contains("maximized")) return;
        const left = findOpenPanelRightEdge();
        const maxLeft = Math.max(66, window.innerWidth - 420);

        overlay.style.left = `${Math.min(left, maxLeft)}px`;
        overlay.style.right = "10px";
        overlay.style.top = "10px";
        overlay.style.bottom = "10px";
        overlay.style.width = "";
        overlay.style.height = "";
    }

    function applyDockedBounds(overlay) {
        if (!isDesktop()) return;
        if (overlay.classList.contains("floating") || overlay.classList.contains("maximized")) return;

        const left = findOpenPanelRightEdge();
        const viewportGap = 12;
        const preferredWidth = 760;
        const minWidth = 420;
        const availableWidth = Math.max(280, window.innerWidth - left - viewportGap);
        const width = Math.max(Math.min(preferredWidth, availableWidth), Math.min(minWidth, availableWidth));

        overlay.style.left = `${left}px`;
        overlay.style.right = "auto";
        overlay.style.width = `${width}px`;
        overlay.style.top = "0px";
        overlay.style.bottom = "0px";
        overlay.style.height = "";
    }

    function updateActionState(overlay) {
        const id = overlay.id;
        const floatBtn = document.querySelector(
            `[data-overlay-action="float"][data-overlay-target="${id}"]`
        );
        const expandBtn = document.querySelector(
            `[data-overlay-action="expand"][data-overlay-target="${id}"]`
        );

        if (floatBtn) floatBtn.classList.toggle("is-active", overlay.classList.contains("floating"));
        if (expandBtn) expandBtn.classList.toggle("is-active", overlay.classList.contains("maximized"));
    }

    function open(overlayId) {
        const overlay = document.getElementById(overlayId);
        if (!overlay) return;

        if (!isDesktop()) {
            document.dispatchEvent(new Event("sidebar:close-panels"));
        }

        document.querySelectorAll(".module-overlay").forEach((el) => el.classList.remove("open"));
        overlay.classList.add("open");
        document.dispatchEvent(new CustomEvent("module:overlay-opened", { detail: { overlayId } }));
        activeOverlayId = overlayId;
        applyDockedBounds(overlay);
        applyMaximizedBounds(overlay);
        updateActionState(overlay);
        document.dispatchEvent(new Event("layout:changed"));
    }

    function close(overlayId) {
        const overlay = document.getElementById(overlayId);
        if (!overlay) return;
        overlay.classList.remove("open");
        if (activeOverlayId === overlayId) activeOverlayId = null;
        overlay.classList.remove("floating");
        overlay.classList.remove("maximized");
        resetOverlayPosition(overlay);
        updateActionState(overlay);
        document.dispatchEvent(new Event("layout:changed"));
    }

    function closeAll() {
        document.querySelectorAll(".module-overlay").forEach((el) => {
            el.classList.remove("open");
            el.classList.remove("floating");
            el.classList.remove("maximized");
            resetOverlayPosition(el);
            updateActionState(el);
        });
        activeOverlayId = null;
        document.dispatchEvent(new Event("layout:changed"));
    }

    function toggleFloat(overlay) {
        if (!isDesktop()) return;
        const willFloat = !overlay.classList.contains("floating");
        overlay.classList.toggle("floating", willFloat);
        if (willFloat) {
            overlay.classList.remove("maximized");
            overlay.style.right = "auto";
        } else {
            overlay.classList.remove("maximized");
            resetOverlayPosition(overlay);
        }
        updateActionState(overlay);
        document.dispatchEvent(new Event("layout:changed"));
    }

    function toggleExpand(overlay) {
        if (!isDesktop()) return;
        const willMax = !overlay.classList.contains("maximized");
        overlay.classList.toggle("maximized", willMax);
        if (willMax) {
            overlay.classList.remove("floating");
            applyMaximizedBounds(overlay);
        }
        if (!willMax) {
            resetOverlayPosition(overlay);
        }
        updateActionState(overlay);
        document.dispatchEvent(new Event("layout:changed"));
    }

    function bindOpenButtons() {
        document.querySelectorAll("[data-module-open]").forEach((btn) => {
            btn.addEventListener("click", () => {
                const target = btn.getAttribute("data-module-open");
                if (!target) return;
                const addonGroup = btn.getAttribute("data-addon-group");
                if (target === "addonsOverlay") {
                    document.dispatchEvent(new CustomEvent("addons:open-group", { detail: { group: addonGroup || "extra_tools" } }));
                }
                if (activeOverlayId === target && !addonGroup) {
                    close(target);
                    return;
                }
                open(target);
            });
        });
    }

    function bindCloseButtons() {
        document.querySelectorAll("[data-overlay-close]").forEach((btn) => {
            btn.addEventListener("click", () => {
                const target = btn.getAttribute("data-overlay-close");
                if (!target) return;
                close(target);
            });
        });
    }

    function bindActionButtons() {
        document.querySelectorAll("[data-overlay-action]").forEach((btn) => {
            btn.addEventListener("click", () => {
                const target = btn.getAttribute("data-overlay-target");
                const action = btn.getAttribute("data-overlay-action");
                if (!target || !action) return;
                const overlay = document.getElementById(target);
                if (!overlay) return;

                if (action === "float") toggleFloat(overlay);
                if (action === "expand") toggleExpand(overlay);
            });
        });
    }

    function makeOverlayDraggable(overlayId, handleEl) {
        const overlay = document.getElementById(overlayId);
        if (!overlay || !handleEl) return;

        let dragging = false;
        let startX = 0;
        let startY = 0;
        let startLeft = 0;
        let startTop = 0;

        const onMouseMove = (event) => {
            if (!dragging) return;
            const dx = event.clientX - startX;
            const dy = event.clientY - startY;

            const nextLeft = Math.max(64, startLeft + dx);
            const nextTop = Math.max(8, startTop + dy);

            overlay.style.left = `${nextLeft}px`;
            overlay.style.top = `${nextTop}px`;
        };

        const onMouseUp = () => {
            dragging = false;
            document.removeEventListener("mousemove", onMouseMove);
            document.removeEventListener("mouseup", onMouseUp);
        };

        handleEl.addEventListener("mousedown", (event) => {
            if (!isDesktop()) return;
            if (!overlay.classList.contains("floating")) return;

            dragging = true;
            startX = event.clientX;
            startY = event.clientY;

            const rect = overlay.getBoundingClientRect();
            startLeft = rect.left;
            startTop = rect.top;

            event.preventDefault();
            document.addEventListener("mousemove", onMouseMove);
            document.addEventListener("mouseup", onMouseUp);
        });
    }

    function bindDragHandles() {
        document.querySelectorAll("[data-overlay-drag-handle]").forEach((handle) => {
            const overlayId = handle.getAttribute("data-overlay-drag-handle");
            if (!overlayId) return;
            makeOverlayDraggable(overlayId, handle);
        });
    }

    function initOpenFromState() {
        const root = document.getElementById("dashboardRoot");
        if (!root) return;
        const wanted = root.getAttribute("data-open-overlay");
        if (!wanted) return;
        open(wanted + "Overlay");
    }

    function normalizeForViewport() {
        if (isDesktop()) return;
        document.querySelectorAll(".module-overlay").forEach((overlay) => {
            overlay.classList.remove("floating");
            overlay.classList.remove("maximized");
            resetOverlayPosition(overlay);
            updateActionState(overlay);
        });
    }

    function syncActiveOverlayBounds() {
        if (!activeOverlayId) return;
        const overlay = document.getElementById(activeOverlayId);
        if (!overlay) return;
        applyDockedBounds(overlay);
        applyMaximizedBounds(overlay);
    }

    function syncAfterLayoutTransition() {
        syncActiveOverlayBounds();
        setTimeout(syncActiveOverlayBounds, 120);
        setTimeout(syncActiveOverlayBounds, 260);
    }

    window.GSIModuleHost = {
        init() {
            if (!document.getElementById("moduleHost")) return;
            bindOpenButtons();
            bindCloseButtons();
            bindActionButtons();
            bindDragHandles();
            initOpenFromState();
            document.querySelectorAll(".module-overlay").forEach((overlay) => updateActionState(overlay));
            normalizeForViewport();
            document.addEventListener("layout:changed", syncAfterLayoutTransition);
            window.addEventListener("resize", normalizeForViewport);
            window.addEventListener("resize", syncAfterLayoutTransition);
        },
        open,
        close,
        closeAll,
    };
})();
