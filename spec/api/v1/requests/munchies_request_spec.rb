require 'rails_helper'

RSpec.describe "Sweater Weather API" do
  it 'can get eta, forecast and open restaurants' do
    city_1 = 'denver,co'
    city_2 = 'peublo,co'
    food = 'chinese'

    get "/api/v1/munchies?start=#{city_1}&end=#{city_2}&food=#{food}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(response[:data][:type]).to eq 'munchie'
    expect(response[:data][:attributes][:end_location]).to be_truthy
    expect(response[:data][:attributes][:travel_time]).to be_truthy
    expect(response[:data][:attributes][:forecast]).to be_truthy
    expect(response[:data][:attributes][:restaurant][:name]).to be_truthy
    expect(response[:data][:attributes][:restaurant][:address]).to be_truthy
  end
end