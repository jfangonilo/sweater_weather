class DirectionsService
  attr_reader :origin,
              :destination

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def travel_time
    get_json[:routes][0][:legs][0][:duration][:text]
  end

  def destination_coordinates
    get_json[:routes][0][:legs][0][:end_location]
  end

  def origin_address
    get_json[:routes][0][:legs][0][:start_address]
  end

  def destination_address
    get_json[:routes][0][:legs][0][:end_address]
  end

  def unix_travel_time
    get_json[:routes][0][:legs][0][:duration][:value]
  end

  private

  def get_json
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://maps.googleapis.com/maps/api/directions/json') do |f|
      f.adapter Faraday.default_adapter
      f.params[:key] = ENV['GOOGLE_DIRECTIONS_KEY']
      f.params[:origin] = "#{origin}"
      f.params[:destination] = "#{destination}"
    end
  end
end