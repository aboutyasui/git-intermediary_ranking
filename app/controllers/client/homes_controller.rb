class Client::HomesController < ApplicationController

  def index
    @posts = Post.all.page(params[:page]).per(10)
  end

end
