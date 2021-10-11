class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new(current_user)
  end

  def create
    # User.create(image: params[:user][:image], self_lntroduction: params[:user][:self_lntroduction])
    
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    if @user.create(user_params)
      redirect_to user_path, notice: "プロフィールを作成しました！"
    else
      render :new
    end
  end

  # def update
  #   if @user.update(user_params)
  #     redirect_to user_path, notice: "プロフィールを更新しました！"
  #   else
  #     render :edit
  #   end
  # end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "プロフィールを更新しました！"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:image, :image_cache)
  end

end
