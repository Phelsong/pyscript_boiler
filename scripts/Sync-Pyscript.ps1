$pyscript_dependencies = 'pyscript.js',
'pyscript.js.map',
'pyscript.css',
'pyscript.css.map'

foreach ($i in $pyscript_dependencies) {
    Remove-Item "../static/pyscript/$($i)"
    Invoke-WebRequest "https://pyscript.net/latest/$($i)" -OutFile "../static/pyscript/$($i)"
}

# ----------------------------------------------------------------

$pyo_dependencies = 'pyodide.js',
'pyodide.js.map',
'python_stdlib.zip',
'pyodide.asm.js',
'pyodide.asm.wasm',
'repodata.json',
'micropip-0.3.0-py3-none-any.whl',
'packaging-23.0-py3-none-any.whl',
'typing_extensions-4.5.0-py3-none-any.whl', 
'tqdm-4.65.0-py3-none-any.whl',
'bleach-6.0.0-py3-none-any.whl',
'webencodings-0.5.1-py2.py3-none-any.whl',
'six-1.16.0-py2.py3-none-any.whl', 
'setuptools-67.6.1-py3-none-any.whl',
'distutils-1.0.0.zip',
'pyparsing-3.0.9-py3-none-any.whl',
'PyYAML-6.0-cp311-cp311-emscripten_3_1_32_wasm32.whl',
'Jinja2-3.1.2-py3-none-any.whl',
'MarkupSafe-2.1.2-cp311-cp311-emscripten_3_1_32_wasm32.whl',
'numpy-1.24.2-cp311-cp311-emscripten_3_1_32_wasm32.whl',
'certifi-2022.12.7-py3-none-any.whl',
'idna-3.4-py3-none-any.whl',
'PIL-9.1.1-cp311-cp311-emscripten_3_1_32_wasm32.whl'
    
foreach ($i in $pyo_dependencies) {
    Remove-Item "../static/pyodide/$($i)"
    Invoke-WebRequest "https://cdn.jsdelivr.net/pyodide/v0.23.4/full/$($i)" -OutFile "../static/pyodide/$($i)"
    Pause 1
}


# ----------------------------------------------------------------
# Packages
# Remove-Item '../static/pyscript/bokeh.js'
# Invoke-WebRequest 'https://cdn.bokeh.org/bokeh/release/bokeh-2.4.3.js' -OutFile '../static/pyscript/bokeh.js'
# Remove-Item '../static/pyscript/bokeh-widgets.min.js'
# Invoke-WebRequest 'https://cdn.bokeh.org/bokeh/release/bokeh-widgets-2.4.3.min.js' -OutFile '../static/pyscript/bokeh-widgets.min.js'
# Remove-Item '../static/pyscript/bokeh-tables.min.js'
# Invoke-WebRequest 'https://cdn.bokeh.org/bokeh/release/bokeh-tables-2.4.3.min.js' -OutFile ../static/pyscript/bokeh-tables.min.js
# Remove-Item '../static/pyscript/panel.min.js'
# Invoke-WebRequest 'https://cdn.jsdelivr.net/npm/@holoviz/panel@0.14.0/dist/panel.min.js' -OutFile ../static/pyscript/panel.min.js


# =================================================================
# ---------- NOTES ----------
# ================================================================
# <link rel="stylesheet" href="https://pyscript.net/snapshots/2023.05.1.RC2/pyscript.css"/>
# <script defer src="https://pyscript.net/snapshots/2023.05.1.RC2/pyscript.js"></script>

# <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
# <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>


# "https://cdn.holoviz.org/panel/0.14.2/dist/wheels/bokeh-2.4.3-py3-none-any.whl",
# "https://cdn.holoviz.org/panel/0.14.2/dist/wheels/panel-0.14.2-py3-none-any.whl",






#ALT 
# https://cdn.jsdelivr.net/pyodide/v0.23.0/pyc/pyodide.js 