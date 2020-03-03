require 'rails_helper'

RSpec.describe 'Sweater Weather API' do
  describe 'can receive a post request to log in' do
    it 'and returns the users api key if successful' do
      create(:user, email: 'whatever@example.com', password: 'password', api_key: '1234')
      mock_data = {
        "email": "whatever@example.com",
        "password": "password"
      }.to_json

      post '/api/v1/sessions', params: mock_data, headers: { "CONTENT_TYPE" => "application/json" }
      expect(response).to be_successful
      expect(response.status).to be 200
      key = JSON.parse(response.body, symbolize_names: true)
      expect(key[:data][:attributes][:api_key]).to be '1234'
    end
  end
end