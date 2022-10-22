class Trader::HomesController < ApplicationController
  def index
    @trader = Trader.find(params[:user_id])
    @reviews=Review.where(trader_id: @trader.id)
  end

  def index_posts
    @posts = Post.page(params[:page]).per(5)
  end

end
