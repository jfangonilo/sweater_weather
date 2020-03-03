class DarkskyService
  attr_reader :lat, :lng, :arrival

  def initialize(coordinates, arrival = nil)
    @lat = coordinates[:lat]
    @lng = coordinates[:lng]
    @arrival = arrival
  end

  def future
    response = conn.get("#{ENV['DARKSKY_KEY']}/#{lat},#{lng},#{arrival}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def result
    response = conn.get("#{ENV['DARKSKY_KEY']}/#{lat},#{lng}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new("https://api.darksky.net/forecast/") do |f|
      f.adapter Faraday.default_adapter
    end
  end
end