class TimetravelService
  attr_reader :lat, :lng, :travel_time

  def initialize(coordinates, travel_time)
    @lat = coordinates[:lat]
    @lng = coordinates[:lng]
    @travel_time = travel_time
  end

  def forecast
    get_json[:currently][:summary]
  end

  def get_json
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def arrival_time
    (Time.now + travel_time).to_i
  end

  def conn
    Faraday.new("https://api.darksky.net/forecast/#{ENV['DARKSKY_KEY']}/#{lat},#{lng},#{arrival_time}") do |f|
      f.adapter Faraday.default_adapter
    end
  end
end