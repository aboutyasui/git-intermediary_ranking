class Trader::ClientsController < ApplicationController
  before_action :authenticate_trader!

  def show
    @client = Client.find(params[:id])
    @comments = Comment.where(client_id: @client.id).page(params[:page]).per(5)
    #Whereを使うことで特定の業者の投稿データを取得できる
  end
end
