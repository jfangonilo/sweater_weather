class Api::V1::BackgroundsController < ApplicationController
  def index
    location = params[:location]
    background = BackgroundFacade.new(location)
  end
end