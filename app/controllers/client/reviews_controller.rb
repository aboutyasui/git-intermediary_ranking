class Client::ReviewsController < ApplicationController
  before_action :authenticate_client!
  before_action :find_params, only: [:edit, :update, :destroy]
  before_action :get_params, only: [:new, :create, :index]

  def new
    @review = current_client.reviews.find_by(trader_id: @trader.id)
    #ログイン中の顧客(current_client)の紐づくレビューデータ(current_client.reviews)に業者情報(@trader.id)を入れる(find_by)
    if @review.present?
      redirect_to edit_client_trader_review_path(@trader.id,@review.id)
    else
      @review = Review.new
    end
  end

  def create
    @review = Review.where(trader_id: @trader.id).where(client_id: current_client.id)
    #Rviewモデルから、特定の業者(@trader.id)と顧客(current_client.id)に関係するレビュー情報を全て取得
    if @review.present? #さっき取得した情報の中にnil(空の情報)がないか確認
      #nilがない場合、editアクションへ
      redirect_to edit_client_trader_review_path(@trader.id,@review.id)
    else
      #nilがある場合、このまま新規登録処理へ
        @review = Review.new(review_params)
        @review.trader_id = @trader.id
        @review.client_id = current_client.id
        @review.save
        redirect_to root_path, notice: "レビューを保存しました"
    end
  end

  def index
    @reviews=Review.where(trader_id: @trader.id)
  end

  def show
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to client_trader_review_path(@trader.id,@review.id), notice: "レビューの更新が成功しました"
    else
      render :edit, notice: "レビューの更新が失敗しました"#編集ページに戻る
    end
  end

  def destroy
    @review.destroy
    redirect_to client_user_path(current_client)
  end

  private

  def review_params
    params.require(:review).permit(:client_id,:trader_id,:star,:review_comment)
  end

  def find_params
    @trader = Trader.find(params[:trader_id])
    @review = Review.find(params[:id])
    @client = @review.client
  end

  def get_params
    @trader = Trader.find(params[:trader_id])
  end

end
