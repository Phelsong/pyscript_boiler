""" App Framework """
# libs
import os
import uvicorn
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import (
    FileResponse,
    StreamingResponse,
)
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel


# imports


# ========================


# ================================================================================
app = FastAPI()
origins = ["http://localhost:8012/", "https://localhost:8012/"]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
app.mount("/static", StaticFiles(directory="./static"), name="static")
app.mount("/web", StaticFiles(directory="./web"), name="web")


def stream_file(file):
    with open(file, "r") as f:
        yield from f


# ==============================================================================


@app.get("/favicon.ico", response_class=FileResponse)
def favicon():
    return FileResponse("static/favicon.ico")


# =============================================================


@app.get("/py_worker.js", response_class=StreamingResponse)
def worker() -> StreamingResponse:
    return StreamingResponse(
        stream_file("static/js/py_worker.js"), media_type="application/javascript"
    )


# ================================================================================


@app.get("/", response_class=StreamingResponse)
def dashboard() -> StreamingResponse:
    return StreamingResponse(stream_file("web/dashboard.html"), media_type="text/html")


# ===============================================================================


@app.get("/health")
def health():
    return {"status": "ok"}


# ================================================================================

config = uvicorn.Config(
    "main:app",
    host="::",
    port=(8000),
    access_log=True,
    reload=True,
    workers=2,
    # reload_includes=[".py", ".html", ".css", ".toml"],
)
server = uvicorn.Server(config)

# ================================================================================

if __name__ == "__main__":
    server.run()
