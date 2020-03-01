class Api::V1::BackgroundsController < ApplicationController
  def index
    location = params[:location]
    service = FlickrService.new(location)
    background_collection = service.backgrounds[:photos][:photo]. map do |data|
      Background.new(data)
    end
    background = background_collection.sample.img_url
  end
end