class Trader::HomesController < ApplicationController
  def index
    @trader = Trader.find(params[:user_id])
    @reviews=Review.where(trader_id: @trader.id)
    ##評価点の平均値を算出
    if @trader.reviews.count >= 1 #評価されたことがtraderかどうかを判断
    reviews=Review.where(trader_id: @trader.id).pluck(:star)#starカラムに保存されている評価点数（文字列型）を取得
    reviews.map!(&:to_i)#取得した変数（reviews）を数列型へ変更する
    @average = reviews.sum.fdiv(reviews.length).round(1)#取得した変数をもとに平均値を算出
    #round(1)とすることで小数点第2位に対して四捨五入をします。
    else
     @average = 0.0
    end
  end
end
