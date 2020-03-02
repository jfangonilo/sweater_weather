class YelpService
  attr_reader :arrival,
              :lat,
              :lng,
              :food

  def initialize(arrival, coords, food)
    @arrival = arrival
    @lat = coords[:lat]
    @lng = coords[:lng]
    @arrival = arrival
    @food = food
  end

  def result
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://api.yelp.com/v3/businesses/search') do |f|
      f.adapter Faraday.default_adapter
      f.headers[:authorization] = "Bearer #{ENV['YELP_KEY']}"
      f.params[:open_at] = "#{arrival}"
      f.params[:term] = "#{food}"
      f.params[:latitude] = "#{lat}"
      f.params[:longitude] = "#{lng}"
    end
  end
end