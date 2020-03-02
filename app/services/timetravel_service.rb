class TimetravelService
  attr_reader :lat, :lng, :arrival_time

  def initialize(coordinates, arrival_time)
    @lat = coordinates[:lat]
    @lng = coordinates[:lng]
    @arrival_time = arrival_time
  end

  def forecast
    get_json[:currently][:summary]
  end

  def get_json
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new("https://api.darksky.net/forecast/#{ENV['DARKSKY_KEY']}/#{lat},#{lng},#{arrival_time}") do |f|
      f.adapter Faraday.default_adapter
    end
  end
end