class HomesController < ApplicationController
  def top
    @traders = Kaminari.paginate_array(Trader.find(Review.group(:trader_id).order('avg(star) desc').pluck(:trader_id))).page(params[:page]).per(5)
    #Kaminari.paginate_array → pageメソッドを配列に対して用いる場合に必要な記述
    @clients = Client.page(params[:page]).per(5)
    @genres = Genre.all
  end

  def about
  end

end
