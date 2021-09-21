class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(topick_id: params[:topick_id])
    redirect_to topicks_path, notice: "#{favorite.topick.user.name}お気に入り登録しました"
  end

  def index
    # ・アクションの定義を設定完了。 ・自分がお気に入りにした一覧が欲しい。
    @favorites = current_user.favorites
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to topicks_path, notice: "#{favorite.topick.user.name}お気に入り解除しました"
  end
end