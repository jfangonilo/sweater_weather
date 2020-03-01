class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :city_state
end
