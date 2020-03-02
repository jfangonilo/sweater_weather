class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :current_weather,
              :details,
              :hourly_weather,
              :daily_weather
end
