(function () {
    let root = null;
    let imgEl = null;
    let statusEl = null;
    let titleEl = null;
    let metaEl = null;
    let activeSrc = "";

    function ensureDom() {
        if (root) return;
        root = document.createElement("section");
        root.className = "gsi-image-viewer";
        root.id = "gsiImageViewer";
        root.innerHTML = `
            <div class="gsi-image-viewer-card" role="dialog" aria-modal="true" aria-label="Image viewer">
                <header class="gsi-image-viewer-head">
                    <div>
                        <h3 class="gsi-image-viewer-title" id="gsiImageViewerTitle">Image Viewer</h3>
                        <p class="gsi-image-viewer-meta" id="gsiImageViewerMeta"></p>
                    </div>
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-image-viewer-close>Close</button>
                </header>
                <div class="gsi-image-viewer-body">
                    <img id="gsiImageViewerImg" class="gsi-image-viewer-img" alt="">
                    <div id="gsiImageViewerStatus" class="gsi-image-viewer-status">Loading image...</div>
                </div>
            </div>
        `;
        document.body.appendChild(root);

        imgEl = document.getElementById("gsiImageViewerImg");
        statusEl = document.getElementById("gsiImageViewerStatus");
        titleEl = document.getElementById("gsiImageViewerTitle");
        metaEl = document.getElementById("gsiImageViewerMeta");

        const closeBtn = root.querySelector("[data-image-viewer-close]");
        if (closeBtn) {
            closeBtn.addEventListener("click", close);
        }
        root.addEventListener("click", (event) => {
            if (event.target === root) close();
        });
        document.addEventListener("keydown", (event) => {
            if (event.key === "Escape" && root.classList.contains("is-open")) {
                close();
            }
        });
    }

    function showLoading() {
        if (!statusEl || !imgEl) return;
        statusEl.textContent = "Loading image...";
        statusEl.style.display = "block";
        imgEl.classList.remove("is-visible");
        imgEl.removeAttribute("src");
    }

    function showError(message) {
        if (!statusEl || !imgEl) return;
        statusEl.textContent = message || "Unable to load image.";
        statusEl.style.display = "block";
        imgEl.classList.remove("is-visible");
        imgEl.removeAttribute("src");
    }

    function buildStreamUrl(source, path) {
        const sourceKey = String(source || "").trim();
        const relativePath = String(path || "").trim();
        if (!sourceKey || !relativePath) return "";
        return `/api/images/stream?source=${encodeURIComponent(sourceKey)}&path=${encodeURIComponent(relativePath)}`;
    }

    function open(options = {}) {
        ensureDom();
        const src = String(options.src || "").trim();
        if (!src) {
            showError("Image URL is required.");
            root.classList.add("is-open");
            return;
        }

        activeSrc = src;
        if (titleEl) titleEl.textContent = String(options.title || "Image Viewer");
        if (metaEl) metaEl.textContent = String(options.meta || "");
        if (imgEl) imgEl.alt = String(options.alt || "Image");
        showLoading();
        root.classList.add("is-open");

        const loader = new Image();
        loader.onload = () => {
            if (activeSrc !== src || !imgEl || !statusEl) return;
            imgEl.src = src;
            imgEl.classList.add("is-visible");
            statusEl.style.display = "none";
        };
        loader.onerror = () => {
            if (activeSrc !== src) return;
            showError("Unable to load image.");
        };
        loader.src = src;
    }

    function openFromStream(options = {}) {
        const source = String(options.source || "").trim();
        const path = String(options.path || "").trim();
        const src = buildStreamUrl(source, path);
        open({
            src,
            title: options.title || "Image Viewer",
            alt: options.alt || path || "Image",
            meta: options.meta || `${source}${path ? ` · ${path}` : ""}`,
        });
    }

    function close() {
        ensureDom();
        activeSrc = "";
        root.classList.remove("is-open");
        if (imgEl) {
            imgEl.classList.remove("is-visible");
            imgEl.removeAttribute("src");
        }
    }

    window.GSIImageViewer = {
        open,
        openFromStream,
        close,
        buildStreamUrl,
    };
})();
