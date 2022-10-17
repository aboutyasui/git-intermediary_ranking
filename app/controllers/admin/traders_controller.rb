class Admin::TradersController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_params, only: [:show,:edit, :update]

  def show
    @posts = Post.where(trader_id: @trader.id).page(params[:page]).per(5)
  end

  def edit
  end

  def update
    if @trader.update(trader_params)
      flash[:notice] ="You have updated user successfully."
      redirect_to admin_trader_path(@trader.id)
    else
      render :edit and return
      #and return = renderの複数使用によるエラーを回避するためのコマンドみたいなもの
    end
  end

  private

  def trader_params
    params.require(:trader).permit(:email, :name, :trader_info,:profile_image, :telephone_number, :genre_id, :is_deleted)
  end

  def find_params
    @trader = Trader.find(params[:id])
  end

end
