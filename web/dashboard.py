# libs
import pyscript as ps
import pyodide 
import asyncio
from js import Uint8Array, File, URL, document
import io

# imports


# =======================
async def main():
    base_url: str = "http://localhost:8000"
    # ============
    print("hello")

    def example_fetch(url: str):
        for i in range(10):
            print(i)
        response = pyodide.http.openurl(url)
        print(response)

    example_fetch(f"{base_url}/health")

    # ==========================================================================


asyncio.ensure_future(main())
