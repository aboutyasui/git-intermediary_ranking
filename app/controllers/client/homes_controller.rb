class Client::HomesController < ApplicationController

  def index
    @posts = Post.page(params[:page]).per(10)
  end

end
