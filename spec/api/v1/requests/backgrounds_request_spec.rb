require 'rails_helper'

RSpec.describe "Sweater Weather API", :vcr do
  it 'can get a background for a city' do
    city = 'denver,co'

    get "/api/v1/backgrounds?location=#{city}"

    expect(response).to be_successful
    background = JSON.parse(response.body, symbolize_names: true)
    expect(background[:data][:type]).to eq 'background'
    expect(background[:data][:attributes][:url]).to be_truthy
  end
end