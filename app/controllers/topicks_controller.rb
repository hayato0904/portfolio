class TopicksController < ApplicationController
  def index
  end

  def new
  @topick = Topick.new
  end
  
end
