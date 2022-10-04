class Trader::UsersController < ApplicationController
  def index
    @traders = Traders.all
  end
  
  def show
    @trader = Trader.find(params[:id])
    @review = Review.new
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end
end
