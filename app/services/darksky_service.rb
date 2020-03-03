class DarkskyService
  attr_reader :lat, :lng, :arrival

  def initialize(coordinates, arrival = nil)
    @lat = coordinates[:lat]
    @lng = coordinates[:lng]
    @arrival = arrival
  end

  def future
    @future_response ||= conn.get("#{ENV['DARKSKY_KEY']}/#{lat},#{lng},#{arrival}")
    JSON.parse(@future_response.body, symbolize_names: true)
  end

  def current
    @current_response ||= conn.get("#{ENV['DARKSKY_KEY']}/#{lat},#{lng}")
    JSON.parse(@current_response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new("https://api.darksky.net/forecast/") do |f|
      f.adapter Faraday.default_adapter
    end
  end
end