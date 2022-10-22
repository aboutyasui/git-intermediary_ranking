class Trader::UsersController < ApplicationController
  before_action :authenticate_trader!#traider側でログイン済みのユーザー限定にするため
  before_action :get_params,only: [:show,:edit,:update]

  def index
    @clients = Client.all
  end

  def show
    @posts = Post.where(trader_id: @trader.id).page(params[:page]).per(5)
    #Whereを使うことで特定の業者の投稿データを取得できる
  end

  def edit
    if @trader == current_trader #ログイン中のユーザーの場合
      render :edit#編集ページに飛べる
    else
      redirect_to trader_user_path(current_trader)#自分のユーザーshowページに飛ぶ
      @trader = current_trader
    end
  end

  def update
    if @trader.update(user_params)
      flash[:notice] ="You have updated user successfully."
      redirect_to trader_user_path(@trader.id)
    else
      render :edit and return
      #and return = renderの複数使用によるエラーを回避するためのコマンドみたいなもの
    end
  end

  def unsubscribe
    @trader = current_trader
  end

  def withdraw
    @trader = current_trader
    @trader.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:trader).permit(:name, :email, :trader_info,:profile_image, :telephone_number, :genre_id)
    #params.require(モデル名).permit(キー1, キー2, ...)
  end

  def get_params
    @trader = Trader.find(params[:id])
  end

end
