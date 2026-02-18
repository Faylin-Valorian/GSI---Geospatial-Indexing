(function () {
    let activePanel = "navPanel";

    function setActivePanel(panelId) {
        const panels = document.querySelectorAll(".menu-panel");
        const tabs = document.querySelectorAll(".dock-tab");

        panels.forEach((p) => p.classList.remove("open"));
        tabs.forEach((t) => t.classList.remove("active"));

        if (!panelId) {
            activePanel = null;
            document.dispatchEvent(new Event("layout:changed"));
            return;
        }

        const panel = document.getElementById(panelId);
        const tab = document.querySelector(`[data-panel-target="${panelId}"]`);

        if (panel) panel.classList.add("open");
        if (tab) tab.classList.add("active");
        activePanel = panelId;
        document.dispatchEvent(new Event("layout:changed"));
    }

    function handleTabClick(event) {
        const tab = event.currentTarget;
        const target = tab.getAttribute("data-panel-target");
        if (!target) return;

        if (activePanel === target) {
            setActivePanel(null);
            return;
        }
        setActivePanel(target);
    }

    function closePanelsOnMobileMapTap() {
        const mapEl = document.getElementById("map");
        if (!mapEl) return;

        mapEl.addEventListener("click", () => {
            if (window.matchMedia("(max-width: 991.98px)").matches && activePanel) {
                setActivePanel(null);
            }
        });
    }

    function bindSessionHud() {
        const hud = document.getElementById("sessionHud");
        const toggle = document.getElementById("sessionHudToggle");
        if (!hud || !toggle) return;

        toggle.addEventListener("click", (event) => {
            event.stopPropagation();
            const willOpen = !hud.classList.contains("open");
            hud.classList.toggle("open", willOpen);
            toggle.setAttribute("aria-expanded", willOpen ? "true" : "false");
        });

        document.addEventListener("click", (event) => {
            if (!hud.classList.contains("open")) return;
            if (hud.contains(event.target)) return;
            hud.classList.remove("open");
            toggle.setAttribute("aria-expanded", "false");
        });
    }

    window.GSISidebar = {
        init() {
            const tabs = document.querySelectorAll(".dock-tab");
            if (!tabs.length) return;

            tabs.forEach((tab) => {
                tab.addEventListener("click", handleTabClick);
            });

            closePanelsOnMobileMapTap();
            bindSessionHud();
            document.addEventListener("sidebar:close-panels", () => setActivePanel(null));
            setActivePanel("navPanel");
        }
    };
})();
