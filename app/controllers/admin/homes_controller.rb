class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @posts = Post.includes(:favorited_clients).sort {|a,b| b.favorited_clients.size <=> a.favorited_clients.size}
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)
  end
end
