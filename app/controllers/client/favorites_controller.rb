class Client::FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    client = current_client
    favorite = current_client.favorites.new(client_id: client.id)
    favorite = current_client.favorites.new(post_id: post.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    post = Post.find(params[:post_id])
    client = current_client
    favorite = current_client.favorites.find_by(client_id: client.id)
    favorite = current_client.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to request.referer
  end

end
