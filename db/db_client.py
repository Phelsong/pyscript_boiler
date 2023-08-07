import os
import tomllib
import psycopg
from psycopg.rows import dict_row


# ----------------------------------------------------------------
try:
    with open(".\\db\\env.toml", "rb") as f:
        data = tomllib.load(f)
        config = data["DB_ENV"]
        # ---
        # TODO
        if config["USER_NAME"] == 1:
            raise ValueError
            print("you forgot to configure your connection details")
        # ---
except FileNotFoundError as e:
    print(e)

# ----------------------------------------------------------------

# ----------------------------------------------------------------
conn = psycopg.connect(
    hostaddr=config["LAB_DB_SERVER"],
    port=config["LAB_DB_PORT"],
    dbname=config["LAB_DB"],
    user=config["USER_NAME"],
    password=config["PASS_WORD"],
    row_factory=dict_row,
)

cur = conn.cursor()
