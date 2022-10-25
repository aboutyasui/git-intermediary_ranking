class Trader::HomesController < ApplicationController
  def index
    @trader = Trader.find(params[:user_id])
    @reviews=Review.where(trader_id: @trader.id)
  end

  def index_posts
    @posts = Post.includes(:favorited_clients).sort {|a,b| b.favorited_clients.size <=> a.favorited_clients.size}
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)
  end

end
