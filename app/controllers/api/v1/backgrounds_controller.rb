class Api::V1::BackgroundsController < ApplicationController
  def index
    conn = Faraday.new('https://www.flickr.com/services/rest') do |f|
      f.adapter Faraday.default_adapter
      f.params[:method] = 'flickr.photos.search'
      f.params[:api_key] = ENV['FLICKR_KEY']
      f.params[:geo_context] = 2 #outdoors
      f.params[:text] = "#{params[:location]}"
      f.params[:tags] = "#{params[:location]},skyline,weather"
      f.params[:format] = 'json'
      f.params[:nojsoncallback] = 1
    end
    response = conn.get
    json = JSON.parse(response.body)
  end
end