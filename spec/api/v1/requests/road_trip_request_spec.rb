require 'rails_helper'

RSpec.describe 'Sweater Weather API' do
  describe 'can receive a request for a road_trip' do
    it 'returns a response if request is valid' do
      create(:user, api_key: 1234)
      mock_data = {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": "1234"
      }.to_json

      post '/api/v1/road_trip', params: mock_data, headers: { "CONTENT_TYPE" => "application/json" }
      expect(response).to be_successful
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result[:data][:attributes]).to be_truthy
    end
  end
end