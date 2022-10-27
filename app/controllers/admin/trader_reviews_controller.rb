class Admin::TraderReviewsController < ApplicationController
  before_action :find_params, only: [:edit, :update, :destroy]
  def index
    @trader = Trader.find(params[:trader_id])
    @reviews = Review.where(trader_id: @trader.id)
  end

  def show
    @client = Client.find(params[:client_id])
    @reviews = Review.where(client_id: @client.id)
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to admin_client_trader_review_path(@client.id,@review.id), notice: "レビューの更新が成功しました"
    else
      render :edit, notice: "レビューの更新が失敗しました"#編集ページに戻る
    end
  end

  def destroy
    @review.destroy
    redirect_to request.referer || root_path, notice: "レビューの削除が成功しました"
  end

  private

  def review_params
    params.require(:review).permit(:client_id,:trader_id,:star,:review_comment)
  end

  def find_params
    @client = Client.find(params[:client_id])
    @review = Review.find(params[:id])
  end

end
