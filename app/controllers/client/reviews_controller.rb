class Client::ReviewsController < ApplicationController
  before_action :authenticate_client!
  before_action :find_params, only: [:edit, :update, :destroy]
  before_action :get_params, only: [:new, :create, :show]

  def new
    @review = Review.new
    #@trader = Trader.find(params[:trader_id])
  end

  def create
    #@trader = Trader.find(params[:trader_id])
    @review = Review.new(review_params)
    @review.trader_id = @trader.id
    @review.client_id = current_client.id
    if @review.save
      redirect_to root_path, notice: "レビューに成功しました"
    else
      render 'new',notice: "レビューに失敗しました"
    end
  end

  def show
    #@trader = Trader.find(params[:trader_id])
    ##評価点の平均値を算出
    @reviews=Review.where(trader_id: @trader.id).pluck(:star)#starカラムに保存されている評価点数（文字列型）を取得
    @reviews.map!(&:to_i)#取得した変数（reviews）を数列型へ変更する
    @reviews.sum.fdiv(reviews.length).round(1)#取得した変数をもとに平均値を算出
    #round(1)とすることで小数点第2位に対して四捨五入をします。
    @review_commes=Review.where(trader_id: @trader.id).pluck(:review_comment)
  end

  def edit
  end

  def update
    if @post.update(review_params)
      redirect_to client_trader_review_path(@trader.id,@review.id), notice: "レビューの更新が成功しました"
    else
      render :edit, notice: "レビューの更新が失敗しました"#編集ページに戻る
    end
  end

  def destroy
    @reveiw.destroy
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
