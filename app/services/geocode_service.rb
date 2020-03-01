class GeocodeService
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def lat_lng
    get_json[:results][0][:geometry][:location]
  end

  def formatted_location
    get_json[:results][0][:formatted_address]
  end

  def get_json
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://maps.googleapis.com/maps/api/geocode/json') do |f|
      f.adapter Faraday.default_adapter
      f.params[:key] = ENV['GOOGLE_GEOCODING_KEY']
      f.params[:address] = "#{location}"
    end
  end
end