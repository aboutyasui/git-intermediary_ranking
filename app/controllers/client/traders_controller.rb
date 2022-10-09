class Client::TradersController < ApplicationController
 before_action :authenticate_client! #ユーザがログインしているかどうかを確認し、ログインしていない場合はユーザをログインページにリダイレクトする。

  def show
    @trader = Trader.find(params[:id])
    @posts = Post.where(trader_id: @trader.id).page(params[:page]).per(5)
    #Whereを使うことで特定の業者の投稿データを取得できる
  end

end
