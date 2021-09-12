class TopicksController < ApplicationController
  def index
    @topicks = Topick.all
  end

  def new
  @topick = Topick.new
  end

  def create
    Topick.create(topick_params)
    redirect_to new_topick_path
  end
  private
  def topick_params
    params.require(:topick).permit(:content)
  end
end
