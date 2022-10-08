class Client::TradersController < ApplicationController
 before_action :authenticate_client! #ユーザがログインしているかどうかを確認し、ログインしていない場合はユーザをログインページにリダイレクトする。

  def index#没
  end

  def show
    @trader = Trader.find(params[:id])
    @posts = Post.page(params[:page]).per(5)
  end

  def show_posts
    @trader = Trader.find(params[:id])
    #@post = @trader.post#特定のtrader（@trader）に関連付けられた投稿全て（.post）を取得し@postに渡す
    #@post_comment = PostComment.new#コメントを投稿するために、空のインスタンス変数を定義する
  end

  # 投稿データのストロングパラメータ
  private

  def trader_params
    params.require(:trader).permit(:email, :name, :trader_info, :telephone_number, :genre_id)
  end

end
