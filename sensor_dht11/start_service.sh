#!/bin/bash
source venv/bin/activate
PYTHONPATH=/opt/sensor_dht11/venv/lib/python3.9/site-packages python3 -m uvicorn sensor_dht11:app --reload --host 0.0.0.0 --port 5000