class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    User.create(image: params[:user][:image], self_lntroduction: params[:user][:self_lntroduction])
  end

  def show
  end

end
