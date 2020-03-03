require 'rails_helper'

RSpec.describe 'Sweater Weather API' do
  describe 'can receive a request for a road_trip' do
    it 'and returns a response if request is valid' do
      create(:user, api_key: 1234)
      mock_data = {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": "1234"
      }.to_json

      post '/api/v1/road_trip', params: mock_data, headers: { "CONTENT_TYPE" => "application/json" }
      expect(response).to be_successful
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result[:data][:type]).to eq 'road_trip'
      expect(result[:data][:attributes][:origin_address]).to be_truthy
      expect(result[:data][:attributes][:destination_address]).to be_truthy
      expect(result[:data][:attributes][:travel_time]).to be_truthy
      expect(result[:data][:attributes][:arrival_temp]).to be_truthy
      expect(result[:data][:attributes][:arrival_summary]).to be_truthy
    end

    it 'and returns an error for bad credentials' do
      create(:user, api_key: 1234)
      mock_data = {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": "12345"
      }.to_json

      post '/api/v1/road_trip', params: mock_data, headers: { "CONTENT_TYPE" => "application/json" }
      expect(response).not_to be_successful
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result[:data]).to eq "Bad Credentials"
    end
  end
end