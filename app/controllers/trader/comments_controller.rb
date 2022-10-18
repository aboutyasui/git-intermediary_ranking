class Trader::CommentsController < ApplicationController
  def index
    @client = Client.find(params[:client_id])
    @comments = Comment.where(client_id: @client.id).page(params[:page]).per(5)
  end
end
