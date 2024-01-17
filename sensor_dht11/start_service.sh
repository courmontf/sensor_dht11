#!/bin/bash
source venv/bin/activate
python3 -m uvicorn sensor_dht11:app --reload --host 0.0.0.0 --port 5000