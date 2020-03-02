class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :current_weather,
              :details,
              :hourly_weather,
              :daily_weather
end
