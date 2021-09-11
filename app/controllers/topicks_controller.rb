class TopicksController < ApplicationController
  def index
  end

  def new
  @topick = Topick.new
  end

  def create
    Topick.create(content: params[:topick][:content])
  end
  
end
