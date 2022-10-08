class Admin::TradersController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_params, only: [:show,:edit, :update]

  def index
    @traders = Trader.page(params[:page]).per(10)
  end

  def show
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
    params.require(:trader).permit(:email, :name, :trader_info, :telephone_number, :genre_id, :is_deleted)
  end

  def find_params
    @trader = Trader.find(params[:id])
  end

end
