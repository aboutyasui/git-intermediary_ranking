class Trader::HomesController < ApplicationController
  def index
    @trader = Trader.find(params[:user_id])
    @reviews=Review.where(trader_id: @trader.id)
  end
end
