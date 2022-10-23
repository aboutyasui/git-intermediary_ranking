class Client::CommentsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @client = Client.find(params[:user_id])
    @comments = Comment.where(client_id: @client.id).page(params[:page]).per(5)
  end

  def create
    post = Post.find(params[:post_id])
    comment = current_client.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to client_trader_post_path(post.trader.id,post.id)
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to client_trader_post_path(@comment.post.trader.id,@comment.post_id), notice: "You have updated book successfully."
    else
      render :edit#編集ページに戻る
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to client_trader_post_path(@comment.post.trader.id,@comment.post_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:client_id,:post_id,:comment)
  end

  def correct_user
    @comment = Comment.find(params[:id])
    @client = @comment.client
    redirect_to(client_trader_post_path(@comment.post.trader.id,@comment.post.id)) unless @client == current_client
  end

end
