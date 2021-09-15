class CommentsController < ApplicationController
  before_action :set_topick, only: [:create, :edit, :update]
  # コメントを保存、投稿するためのアクションです。
  def create
    # Topickをパラメータの値から探し出し,Topickに紐づくcommentsとしてbuildします。
    @topick = Topick.find(params[:topick_id])
    @comment = @topick.comments.build(comment_params)
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to topick_path(@topick), notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
    @comment = @topick.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end
  
  def update
    @comment = @topick.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit_error }
        end
      end
  end

  private
  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit(:topick_id, :content)
  end
  def set_topick
    @topick = Topick.find(params[:topick_id])
  end
end