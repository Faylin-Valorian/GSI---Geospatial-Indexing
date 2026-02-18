(function () {
    const storageKey = "gsi_enterprise_theme";

    function getSavedTheme() {
        const stored = window.localStorage.getItem(storageKey);
        return stored === "light" || stored === "dark" ? stored : null;
    }

    function setTheme(theme) {
        document.documentElement.setAttribute("data-bs-theme", theme);
        window.localStorage.setItem(storageKey, theme);
        updateThemeIcon(theme);
        document.dispatchEvent(new CustomEvent("theme:changed", { detail: { theme } }));
    }

    function updateThemeIcon(theme) {
        const icon = document.getElementById("themeIcon");
        if (!icon) return;
        icon.className = theme === "dark" ? "bi bi-sun-fill" : "bi bi-moon-stars-fill";
    }

    function toggleTheme() {
        const current = document.documentElement.getAttribute("data-bs-theme") || "dark";
        const next = current === "dark" ? "light" : "dark";
        setTheme(next);
    }

    window.GSITheme = {
        init() {
            const preferred = getSavedTheme() || "dark";
            setTheme(preferred);

            const btn = document.getElementById("themeToggle");
            if (btn) btn.addEventListener("click", toggleTheme);
        },
        current() {
            return document.documentElement.getAttribute("data-bs-theme") || "dark";
        }
    };
})();
