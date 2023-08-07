const APP_CACHE = "PyScriptAppCache";
const assets = [
  "/static/pyscript/pyscript.js",
  "/static/pyscript/pyscript.js.map",
  "/static/pyscript/pyscript.css",
  "/static/pyscript/pyscript.css.map",

  "/static/pyodide/pyodide.js",
  "/static/pyodide/pyodide.js.map",
  "/static/pyodide/python_stdlib.zip",
  "/static/pyodide/pyodide.asm.js",
  "/static/pyodide/pyodide.asm.wasm",
  "/static/pyodide/repodata.json",
  "/static/pyodide/micropip-0.3.0-py3-none-any.whl",
  "/static/pyodide/packaging-23.0-py3-none-any.whl",
  "/static/pyodide/typing_extensions-4.5.0-py3-none-any.whl",
  "/static/pyodide/tqdm-4.65.0-py3-none-any.whl",
  "/static/pyodide/bleach-6.0.0-py3-none-any.whl",
  "/static/pyodide/webencodings-0.5.1-py2.py3-none-any.whl",
  "/static/pyodide/six-1.16.0-py2.py3-none-any.whl",
  "/static/pyodide/setuptools-67.6.1-py3-none-any.whl",
  "/static/pyodide/distutils-1.0.0.zip",
  "/static/pyodide/pyparsing-3.0.9-py3-none-any.whl",
  "/static/pyodide/PyYAML-6.0-cp311-cp311-emscripten_3_1_32_wasm32.whl",
  "/static/pyodide/Jinja2-3.1.2-py3-none-any.whl",
  "/static/pyodide/MarkupSafe-2.1.2-cp311-cp311-emscripten_3_1_32_wasm32.whl",
  "/static/pyodide/numpy-1.24.2-cp311-cp311-emscripten_3_1_32_wasm32.whl",
  "/static/pyodide/certifi-2022.12.7-py3-none-any.whl",
  "/static/pyodide/idna-3.4-py3-none-any.whl",
  "/static/pyodide/PIL-9.1.1-cp311-cp311-emscripten_3_1_32_wasm32.whl",
];

self.addEventListener("install", (installEvent) => {
  installEvent.waitUntil(
    caches
      .open(APP_CACHE)
      .then((cache) => {
        cache
          .addAll(assets)
          .then((r) => {
            console.log("Cache assets downloaded");
          })
          .catch((err) => console.log("Error caching item", err));
        console.log(`Cache ${APP_CACHE} opened.`);
      })
      .catch((err) => console.log("Error opening cache", err))
  );
});

self.addEventListener("fetch", (fetchEvent) => {
  fetchEvent.respondWith(
    caches
      .match(fetchEvent.request)
      .then((res) => {
        return res || fetch(fetchEvent.request);
      })
      .catch((err) => console.log("Cache fetch error: ", err))
  );
});
