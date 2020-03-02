class Api::V1::MunchiesController < ApplicationController
  def index
    munchies = MunchiesFacade.new(params)
    render json: MunchieSerializer.new(munchies)
  end
end