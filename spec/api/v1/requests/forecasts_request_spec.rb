require 'rails_helper'

RSpec.describe "Sweather Weather API" do
  it 'can get a forecast for a city' do
    city = 'denver,co'

    get "/api/v1/forecast?location=#{city}"

    expect(response).to be_successful
    forecast = JSON.parse(response.body, symbolize_names: true)
    expect(background[:data][:type]).to eq 'forecast'
  end
end