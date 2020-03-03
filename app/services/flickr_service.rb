class FlickrService
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def backgrounds
    @response ||= conn.get
    JSON.parse(@response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('https://www.flickr.com/services/rest') do |f|
      f.adapter Faraday.default_adapter
      f.params[:method] = 'flickr.photos.search'
      f.params[:api_key] = ENV['FLICKR_KEY']
      f.params[:geo_context] = 2 #outdoors
      f.params[:text] = "#{location} skyline"
      f.params[:tags] = "#{location} skyline city"
      f.params[:format] = 'json'
      f.params[:nojsoncallback] = 1
      f.params[:safe_search] = 1
      f.params[:content_type] = 1
    end
  end
end