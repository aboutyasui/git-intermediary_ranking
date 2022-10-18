class Client::PostsController < ApplicationController

  def index
    @trader = Trader.find(params[:trader_id])
    #@posts = Post.where(trader_id: @trader.id).page(params[:page]).per(5)
    @posts = Post.where(trader_id: @trader.id).includes(:favorited_clients).sort {|a,b| b.favorited_clients.size <=> a.favorited_clients.size}
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

end
