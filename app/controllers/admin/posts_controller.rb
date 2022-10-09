class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_post, only: [:show, :edit, :update, :destroy]

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
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
