class Trader::ReviewsController < ApplicationController

  def show
    @client = Client.find(params[:client_id])
    @reviews = Review.where(client_id: @client.id)
  end
end
