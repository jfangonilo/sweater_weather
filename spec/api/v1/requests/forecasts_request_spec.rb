require 'rails_helper'

RSpec.describe "Sweather Weather API" do
  it 'can get a forecast for a city' do
    city = 'denver,co'

    get "/api/v1/forecast?location=#{city}"

    expect(response).to be_successful
    forecast = JSON.parse(response.body, symbolize_names: true)
    expect(forecast[:data][:type]).to eq 'forecast'
    expect(forecast[:data][:attributes][:current_weather][:location]). to eq "Denver, CO, USA"
    expect(forecast[:data][:attributes][:hourly_weather].length).to eq 8
    expect(forecast[:data][:attributes][:daily_weather].length).to eq 5
  end
end