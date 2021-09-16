class FavoritesController < ApplicationController
  def create
    binding.pry
    favorite = current_user.favorites.create(topick_id: params[:topik_id])
    redirect_to topicks_path, notice: "#{favorite.topick.user.name}さんのブログをお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to topicks_path, notice: "#{favorite.topick.user.name}さんのブログをお気に入り解除しました"
  end
end