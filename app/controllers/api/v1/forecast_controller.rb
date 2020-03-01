class Api::V1::ForecastController < ApplicationController
  def index
    location = params[:location]
    conn = Faraday.new('https://maps.googleapis.com/maps/api/geocode/json') do |f|
      f.adapter Faraday.default_adapter
      f.params[:key] = ENV['GOOGLE_GEOCODING_KEY']
      f.params[:address] = "#{location}"
    end
    response = conn.get
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end