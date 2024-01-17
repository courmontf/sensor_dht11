import time
import board
import adafruit_dht
from fastapi import FastAPI


app = FastAPI()
sensor = adafruit_dht.DHT11(board.D23)


@app.get("/sensor/dht11/state")
def temperature():
    return {"temperature": sensor.temperature, "humidity": sensor.humidity}


if __name__ == "__main__":
    app.run(debug=False)