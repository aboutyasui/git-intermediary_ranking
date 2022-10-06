class Client::UsersController < ApplicationController
  before_action :authenticate_client!#client側でログイン済みのユーザー限定にするため
  before_action :get_params,only: [:show,:edit,:update]

  def show
  end

  def edit
    if @client == current_client #ログイン中のユーザーの場合
      render :edit#編集ページに飛べる
    else
      redirect_to client_user_path(current_client)#自分のユーザーshowページに飛ぶ
      @client = current_client
    end
  end

  def update
    if @client.update(user_params)
      flash[:notice] ="You have updated user successfully."
      redirect_to client_user_path(@client.id)
    else
      render :edit and return
      #and return = renderの複数使用によるエラーを回避するためのコマンドみたいなもの
    end
  end

  def unsubscribe
    @client = current_client
  end

  def withdraw
    @client = current_client
    @client.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:client).permit(:name, :email, :client_info, :telephone_number, :work)
    #params.require(モデル名).permit(キー1, キー2, ...)
  end

  def get_params
    @client = Client.find(params[:id])
  end
end
