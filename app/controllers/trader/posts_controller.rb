class Trader::PostsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.trader_id = current_trader.id
    if @post.save
      flash[:notice] ="You have created post successfully."
      #redirect_to trader_user_path(@post.trader_id)
      redirect_to trader_post_path(@post.id)
    else
      redirect_to trader_user_path(current_trader) #投稿失敗時、マイページに飛ぶ
    end
  end

  def index
    @posts = Post.all.page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to trader_post_path(@post.id), notice: "You have updated book successfully."
    else
      render :edit#編集ページに戻る
    end
  end

  def destroy
    @post.destroy
    redirect_to trader_user_path(current_trader)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def correct_user
    @post = Post.find(params[:id])
    @trader = @post.trader
    redirect_to(trader_post_path(@post.id)) unless @trader == current_trader
  end

end
