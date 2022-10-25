class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @trader = Trader.find(params[:trader_id])
    @posts = Post.where(trader_id: @trader.id).includes(:favorited_clients).sort {|a,b| b.favorited_clients.size <=> a.favorited_clients.size}
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to admin_trader_post_path(@post.id), notice: "You have updated book successfully."
    else
      render :edit#編集ページに戻る
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_trader_posts_path(@post.trader.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
