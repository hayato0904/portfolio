class TopicksController < ApplicationController
  before_action :set_topick, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    # @topicks = Topick.all
    @q = Topick.ransack(params[:q]) 
    @topicks = @q.result(distinct: true)
  end

  def new
  @topick = Topick.new
  end

  def create
    # @topick = Topick.new(topick_params)
    @topick = current_user.topicks.build(topick_params)
    if topick_params[:back]
      render :new
    else
      if @topick.save
        redirect_to new_topick_path, notice: "掲示板に投稿しました！"
      else
        render :new
      end
    end
  end

def show
  @comments = @topick.comments
  @comment = @topick.comments.build
  @favorite = current_user.favorites.find_by(topick_id: @topick.id)
end

def edit
end

def update
    if @topick.update(topick_params)
      redirect_to topicks_path, notice: "掲示板を編集しました！"
    else
      render :edit
    end
  end

def destroy
  @topick.destroy
  redirect_to topicks_path, notice:"掲示板に投稿したものを削除しました！"
end

def confirm
  @topick = Topick.new(topick_params)
  @topick = current_user.topicks.build(topick_params)
  render :new if @topick.invalid?
end

  private
  def topick_params
    params.require(:topick).permit(:content)
  end

  def set_topick
    @topick = Topick.find(params[:id])
  end
end
