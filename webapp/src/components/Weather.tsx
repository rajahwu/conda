import React, { useEffect, useState } from 'react';

const Weather: React.FC = () => {
  const [weather, setWeather] = useState<string>('Loading...');
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchWeather = async () => {
      try {
        // First, we need to get the coordinates for a location
        // For this example, we'll use New York City's coordinates
        const latitude = 39.9572992;
        const longitude = -75.235328;

        const response = await fetch(
          `https://api.weather.gov/points/${latitude},${longitude}`,
          {
            headers: {
              'User-Agent': '(myweatherapp.com, contact@myweatherapp.com)'
            }
          }
        );
        const data = await response.json();

        // Now we can get the forecast URL from the response
        const forecastUrl = data.properties.forecast;

        const forecastResponse = await fetch(forecastUrl, {
          headers: {
            'User-Agent': '(myweatherapp.com, contact@myweatherapp.com)'
          }
        });
        const forecastData = await forecastResponse.json();

        // Get the current period's forecast
        const currentForecast = forecastData.properties.periods[0];

        setWeather(`${currentForecast.temperature}°${currentForecast.temperatureUnit} - ${currentForecast.shortForecast}`);
      } catch (err) {
        console.error('Error fetching weather:', err);
        setError('Failed to fetch weather data');
      }
    };

    fetchWeather();
  }, []);

  return (
    <div className="widget">
      <h2>Weather</h2>
      {error ? <p>{error}</p> : <p>{weather}</p>}
    </div>
  );
};

export default Weather;