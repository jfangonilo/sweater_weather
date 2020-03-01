require 'rails_helper'

RSpec.describe "Sweater Weather API" do
  it 'can get a background for a city' do
    city = 'denver,co'

    get "/api/v1/background?location=#{city}"

    expect(response).to be_successful
  end
end