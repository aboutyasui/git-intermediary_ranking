class Client::UserReviewsController < ApplicationController
  def index
    @client = Client.find(params[:user_id])
    @reviews = Review.where(client_id: @client.id).page(params[:page]).per(5)
  end
end
