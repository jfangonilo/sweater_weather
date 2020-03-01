class Api::V1::ForecastController < ApplicationController
  def index
    forecast = ForecastFacade.new(params[:location])
    location = forecast.lat_lng
    binding.pry
    lat = location[:lat]
    lng = location[:lng]

    conn = Faraday.new("https://api.darksky.net/forecast/#{ENV['DARKSKY_KEY']}/#{lat},#{lng}") do |f|
      f.adapter Faraday.default_adapter
    end
    response = conn.get
    weather = JSON.parse(response.body, symbolize_names: true)

    # render json: ForecastSerializer.new(forecast)
  end
end