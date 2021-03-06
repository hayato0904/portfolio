class TopsController < ApplicationController
  def guest_sign_in
    # 自分の==================
    # user = User.find_or_create_by!(email: 'guest@example.com') do |user|
    # ========================
    # ピーターの===============
    user = User.find_or_create_by!(name:'guest',email: 'guest@example.com') do |user|
    #========================
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in user
    redirect_to topicks_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def admin_guest_sign_in
    # 自分の==================
    # user = User.find_or_create_by!(email: 'adminguest@example.com', admin: 'true') do |user|
    # ========================
    # ピーターの===============
    user = User.find_or_create_by!(name: 'admin',email: 'adminguest@example.com', admin: 'true') do |user|
    #========================
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in user
    redirect_to topicks_path, notice: '管理者ゲストユーザーとしてログインしました。'
  end

end
