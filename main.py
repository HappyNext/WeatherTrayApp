from src.weather_api import WeatherClient
from src.config import DEFAULT_CITY

client = WeatherClient()
print(f"Request a weather forecast for: {DEFAULT_CITY}...")

weather = client.get_current_weather(DEFAULT_CITY)

print(weather)