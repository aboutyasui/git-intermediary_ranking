# frozen_string_literal: true

class Client::SessionsController < Devise::SessionsController
  #before_action :configure_permitted_parameters, if: :devise_controller?
   
  ##ログイン処理が実行される前に、退会ステータス確認
  before_action :client_state, only: [:create]

  def after_sign_in_path_for(resource)
    client_user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  #ゲストログイン用の処理
  def guest_sign_in
    user = Client.guest
    sign_in user
    redirect_to client_user_path(user) , notice: 'ゲストユーザーとしてログインしました。'
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  
  #def configure_permitted_parameters
   # devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  #end
  
  # 退会しているかを判断するメソッド
  def client_state
    #sigin_in時に入力されたemailからアカウントを１件取得
    @client = Client.find_by(email: params[:client][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@client
    ## 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @client.valid_password?(params[:client][:password]) && @client.is_deleted == true
      ##trueだった場合、退会しているのでサインアップ画面に遷移する
      flash[:alert] = "このアカウントは退会済みです。"
      redirect_to new_client_registration_path
    end
    ##falseだった場合、退会していないのでそのままcreateアクションを実行させる処理を実行する
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
