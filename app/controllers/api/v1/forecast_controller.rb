class Api::V1::ForecastController < ApplicationController
  def index
    forecast = ForecastFacade.new(params[:location])
    location = forecast.lat_lng
    lat = location[:lat]
    lng = location[:lng]

    service = DarkskyService.new(location)
    weather = service.weather
    binding.pry

    # render json: ForecastSerializer.new(forecast)
  end
end