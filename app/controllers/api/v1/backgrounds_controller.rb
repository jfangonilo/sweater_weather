class Api::V1::BackgroundsController < ApplicationController
  def index
    location = params[:location]
    service = FlickrService.new(location)
    service.backgrounds
  end
end