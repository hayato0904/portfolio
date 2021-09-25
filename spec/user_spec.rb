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

end

