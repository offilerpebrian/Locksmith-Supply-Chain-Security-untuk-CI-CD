from fastapi import FastAPI
import os

app = FastAPI()

@app.get("/")
def read_root():
    return {
        "service": "locksmith-demo",
        "version": os.getenv("APP_VERSION", "dev"),
        "message": "Supply-chain security demo is running."
    }
