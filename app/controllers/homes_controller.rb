class HomesController < ApplicationController
  def top
    @traders = Trader.page(params[:page]).per(10)
    @clients = Client.page(params[:page]).per(10)
  end

  def about
  end

end
