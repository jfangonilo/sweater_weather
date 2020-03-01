class DarkskyService
  attr_reader :lat, :lng

  def initialize(coordinates)
    @lat = coordinates[:lat]
    @lng = coordinates[:lng]
  end

  def weather
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.darksky.net/forecast/#{ENV['DARKSKY_KEY']}/#{lat},#{lng}") do |f|
      f.adapter Faraday.default_adapter
    end
  end
end