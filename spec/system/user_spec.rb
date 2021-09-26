require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user2) }
  let!(:user3) { FactoryBot.create(:user3) }

  describe 'ユーザー新規作成機能' do
    context 'ユーザー新規作成した場合' do
      it 'ユーザーを新規登録できる' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'test'
        fill_in 'user[email]', with: 'test@test.com'
        fill_in 'user[password]', with: 'testtest'
        fill_in 'user[password_confirmation]', with: 'testtest'
        click_on 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました'
      end
    end
  end

  describe 'ユーザーログイン機能' do
    context 'ユーザーがログインをした場合' do
      it 'ユーザーがログインできる' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'foo@foo.com'
        fill_in 'user[password]', with: 'foofoo'
        all("input")[3].click
        expect(page).to have_content 'ログインしました'
      end
    end
  end

  describe 'ユーザーゲストログイン機能' do
    context 'ユーザーがゲストログインをした場合' do
      it 'ユーザーがゲストログインできる' do
        visit root_path
        click_on 'ゲストログイン'
        expect(page).to have_content 'ゲストユーザーとしてログインしました。'
      end
    end
  end

  describe 'ユーザー管理者ゲストログイン機能' do
    context 'ユーザーが管理者ゲストログインをした場合' do
      it 'ユーザーが管理者ゲストログインできる' do
        visit root_path
        click_on '管理者ゲストログイン'
        expect(page).to have_content '管理者ゲストユーザーとしてログインしました。'
      end
    end
  end

  describe '他人の投稿は編集できない機能' do
    context '他の人が投稿した場合は' do
      it '編集できない' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'foo@foo.com'
        fill_in 'user[password]', with: 'foofoo'
        all("input")[3].click
        click_on '掲示板に投稿する'
        click_on '新しく掲示板を投稿する'
        fill_in 'topick[content]', with: 'さしすせそ'
        click_on '登録する'
        click_on '登録する'
        click_on '掲示板一覧画面にもどる'
        
        click_on 'ログアウト'
        click_on 'ログイン'
        fill_in 'user[email]', with: 'bar@bar.com'
        fill_in 'user[password]', with: 'barbar'
        all("input")[3].click
        click_on '掲示板に投稿する'
        
        expect(page).not_to have_content '掲示板を編集する'
      end
    end
  end


end

