import requests
from src.config import WEATHER_API_KEY, UNITS, LANGUAGE

class WeatherClient:
    def __init__(self):
        self.base_url = "http://api.openweathermap.org/data/2.5/weather"
    
    def get_current_weather(self,city):
        params = {
            "q": city,
            "appid": WEATHER_API_KEY,
            "units": UNITS,
            "lang": LANGUAGE
        }

        try:
            response = requests.get(self.base_url, params=params, timeout=5)
            data = response.json()

            return data
        except KeyError:
            print("Reading error!")