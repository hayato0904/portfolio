class TopsController < ApplicationController
  def guest_sign_in
    # ピーターの===============
    user = User.find_or_create_by!(name:'guest',email: 'guest@example.com') do |user|
    #========================
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in user
    redirect_to topicks_path
    # , notice: 'ゲストユーザーとしてログインしました。'
    # 上記2行は、なぜか「ゲストユーザーとしてログインしました」という文字が2つでるので、削除しておく。
  end

  def admin_guest_sign_in
    # ピーターの===============
    user = User.find_or_create_by!(name: 'admin',email: 'adminguest@example.com', admin: 'true') do |user|
    #========================
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in user
    redirect_to topicks_path
    # , notice: '管理者ゲストユーザーとしてログインしました。'
    # 上記2行は、なぜか「管理者ゲストユーザーとしてログインしました」という文字が2つでるので、削除しておく。
  end

end
