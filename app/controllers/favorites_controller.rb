class FavoritesController < ApplicationController
 
  def create
    binding.pry
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to posts_url, notice: "#{favorite.user.name}さんの写真をお気に入りに登録しました"
  end
  
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to posts_url, notice: "#{favorite.user.name}さんの写真をお気に入りを解除しました"
　end
 end
end
