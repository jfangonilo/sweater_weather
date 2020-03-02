class Api::V1::MunchiesController < ApplicationController
  def index
    munchies = MunchiesFacade.new(params)
    # render json: MunchiesSerializer.new(munchies)
  end
end