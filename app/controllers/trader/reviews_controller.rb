class Trader::ReviewsController < ApplicationController

  def index
    @client = Client.find(params[:client_id])
    @reviews = Review.where(client_id: @client.id).page(params[:page]).per(5)
  end
end
