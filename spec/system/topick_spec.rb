require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    FactoryBot.create(:topick)
    # FactoryBot.create(:user)
    FactoryBot.create(:user2)
    FactoryBot.create(:user3)
    visit new_user_session_path
    fill_in 'user[email]', with: 'foo@foo.com'
    fill_in 'user[password]', with: 'foofoo'
    all("input")[3].click
    expect(page).to have_content 'ログインしました'  
  end
  describe '掲示板投稿機能' do
    context '掲示板に投稿した場合' do
      it '投稿したものが表示される' do
        visit new_topick_path
        fill_in 'topick[content]', with: 'あいうえお'
        click_on '登録する'
        click_on '登録する'
        click_on '掲示板一覧画面にもどる'
        expect(page).to have_content 'あいうえお'
      end
    end
  end
end
