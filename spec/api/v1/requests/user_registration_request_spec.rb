require 'rails_helper'

RSpec.describe 'Sweater Weather API' do
  it 'can receive a post request for a new user and returns an api key if valid' do
    mock_data = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }.to_json

    post "/api/v1/users", params: mock_data, headers: { "CONTENT_TYPE" => "application/json" }
    expect(response).to be_successful
    expect(response.status).to be 201
    key = JSON.parse(response.body, symbolize_names: true)

    expect(key[:data][:attributes][:api_key]).to be_truthy
  end

  it 'returns an error if credentials bad' do
    mock_data = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password1"
    }.to_json

    post "/api/v1/users", params: mock_data, headers: { "CONTENT_TYPE" => "application/json" }
    expect(response.status).to be 400
    result = JSON.parse(response.body, symbolize_names: true)
    expect(result[:data]).to eq 'Bad Credentials'
  end
end