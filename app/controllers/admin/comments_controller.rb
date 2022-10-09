class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_params, only: [:edit, :update, :destroy]

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to admin_client_post_path(@client.id,@comment.post_id), notice: "You have updated book successfully."
    else
      render :edit#編集ページに戻る
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_trader_post_path(@post.trader.id,@post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:client_id,:post_id,:comment)
  end

  def find_params
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @client = @comment.client
  end

end
