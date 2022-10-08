# frozen_string_literal: true

class Trader::SessionsController < Devise::SessionsController
  #ログイン処理が実行される前に、退会ステータス確認
  before_action :trader_state, only: [:create]

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  #ゲストログイン用の処理
  def guest_sign_in
    user = Trader.guest
    sign_in user
    redirect_to root_path , notice: 'ゲストユーザーとしてログインしました。'
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
  # 退会しているかを判断するメソッド
  def trader_state
    #sigin_in時に入力されたemailからアカウントを１件取得
    @trader = Trader.find_by(email: params[:trader][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@trader
    ## 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @trader.valid_password?(params[:trader][:password]) && @trader.is_deleted == "withdrawal"
      ##trueだった場合、退会しているのでサインアップ画面に遷移する
      flash[:alert] = "このアカウントは退会済みです。"
      redirect_to new_trader_registration_path
    end
    ##falseだった場合、退会していないのでそのままcreateアクションを実行させる処理を実行する
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
