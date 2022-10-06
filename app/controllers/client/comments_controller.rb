class Client::CommentsController < ApplicationController
  def edit
    @post = Post.find(params[:id])
    
  end
end
