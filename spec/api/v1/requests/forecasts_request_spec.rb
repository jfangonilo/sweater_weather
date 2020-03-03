require 'rails_helper'

RSpec.describe "Sweater Weather API", :vcr do
  it 'can get a forecast for a city' do
    city = 'denver,co'

    get "/api/v1/forecast?location=#{city}"

    expect(response).to be_successful
    forecast = JSON.parse(response.body, symbolize_names: true)
    expect(forecast[:data][:type]).to eq 'forecast'
    expect(forecast[:data][:attributes][:current_weather][:location]). to eq "Denver, CO, USA"

    expect(forecast[:data][:attributes][:hourly_weather].length).to eq 8
    forecast[:data][:attributes][:hourly_weather].each do |hourly_forecast|
      expect(hourly_forecast[:temperature]).to be_truthy
      expect(hourly_forecast[:time]).to be_truthy
    end

    expect(forecast[:data][:attributes][:daily_weather].length).to eq 5
    forecast[:data][:attributes][:daily_weather].each do |daily_forecast|
      expect(daily_forecast[:time]).to be_truthy
      expect(daily_forecast[:summary]).to be_truthy
      expect(daily_forecast[:chance_precip]).to be_truthy
      expect(daily_forecast[:high_temp]).to be_truthy
      expect(daily_forecast[:low_temp]).to be_truthy
    end
  end
end