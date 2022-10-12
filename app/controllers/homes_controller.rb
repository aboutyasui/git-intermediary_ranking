class HomesController < ApplicationController
  def top
    @traders = Trader.page(params[:page]).per(10)
    #@traders = Kaminari.paginate_array(Trader.group(:trader).order('avg(star) desc').pluck(:star)).page(params[:page])
    @clients = Client.page(params[:page]).per(10)
  end

  def about
  end

end
