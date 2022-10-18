class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @posts = Post.all.page(params[:page]).per(5)
  end
end
