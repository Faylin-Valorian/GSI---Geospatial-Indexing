document.addEventListener("DOMContentLoaded", () => {
    if (window.GSITheme) window.GSITheme.init();
    if (window.GSIMap) window.GSIMap.init();
    if (window.GSISidebar) window.GSISidebar.init();
    if (window.GSIModuleHost) window.GSIModuleHost.init();
    if (window.GSIAddonsPanel) window.GSIAddonsPanel.init();

    document.addEventListener("theme:changed", (event) => {
        if (window.GSIMap) window.GSIMap.onThemeChanged(event.detail.theme);
    });

    const onLayoutChange = () => {
        if (!window.GSIMap) return;
        setTimeout(() => window.GSIMap.resize(), 260);
    };

    document.addEventListener("layout:changed", onLayoutChange);
    window.addEventListener("resize", onLayoutChange);
});
