class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_params, only: [:edit, :update, :destroy]

  def index
    @client = Client.find(params[:client_id])
    @comments = Comment.where(client_id: @client.id).page(params[:page]).per(5)
  end

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
    redirect_to request.referer || root_path  #元のviewに戻る・・・失敗した場合はroot_pathへ
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
