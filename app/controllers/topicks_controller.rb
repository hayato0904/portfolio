class TopicksController < ApplicationController
  def index
    @topicks = Topick.all
  end

  def new
  @topick = Topick.new
  end

  def create
    @topick = Topick.new(topick_params)
    if @topick.save
    redirect_to new_topick_path, notice: "掲示板に投稿しました！"
    else
      render :new
    end
  end

def show
  @topick = Topick.find(params[:id])
end

  private
  def topick_params
    params.require(:topick).permit(:content)
  end
end
