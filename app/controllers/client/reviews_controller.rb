class Client::ReviewsController < ApplicationController
  before_action :authenticate_client!
  before_action :find_params, only: [:edit, :update, :destroy]
  before_action :get_params, only: [:new, :create, :show]

  def new
    @review = Review.new
  end

  def create
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
    @reviews=Review.where(trader_id: @trader.id)
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
