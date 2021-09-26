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

  describe '掲示板編集機能' do
    context '掲示板を編集した場合' do
      it '編集したものが表示される' do
        visit topicks_path
        task_td = all('tr td')
        #binding.irb
        task_td[3].click
        page.driver.browser.switch_to.alert.accept
        #all('tr td')[4].click

        fill_in 'topick[content]', with: 'あいうえお'
        click_on '更新する'
        expect(page).to have_content '掲示板を編集しました'
      end
    end
  end

  describe '掲示板削除機能' do
    context '掲示板を削除した場合' do
      it '掲示板が削除される' do
        visit topicks_path
        task_td = all('tr td')
        #binding.irb
        task_td[4].click
        page.driver.browser.switch_to.alert.accept
        #all('tr td')[4].click
        expect(page).to have_content '掲示板に投稿したものを削除しました！'
      end
    end
  end

  describe 'コメント機能' do
    context 'コメントをした場合' do
      it 'コメントが画面にある' do
        visit topicks_path
        task_td = all('tr td')
        #binding.irb
        task_td[2].click
        fill_in 'comment[content]', with: 'あいうえお'
        click_on '登録する'
        #all('tr td')[4].click
        expect(page).to have_content 'あいうえお'
      end
    end
  end

  describe 'コメント編集機能' do
    context 'コメントを編集した場合' do
      it 'コメントが編集したものに変更される' do
        visit topicks_path
        task_td = all('tr td')
        task_td[2].click

        # これから編集したいコメントを投稿する ==================
        fill_in 'comment[content]', with: 'あいうえお'
        click_on '登録する'
        # 上で投稿したコメントを編集していく ====================
        click_on 'コメント編集'
        # textarea = all('textarea').first # 今回は入力ボックスが複数あるため，fill_inは使えないみたい
        # fill_in textarea, with: 'かきくけこ' # 今回は入力ボックスが複数あるため，fill_inは使えないみたい
        comment_edit = all("textarea")[0]
        comment_edit.set("かきくけこ") # fill_inが使えない時，要素に対して.set("入力したい文字列")をすることで入力可能
        click_on '更新する'
        expect(page).to have_content 'コメントが編集されました'
      end
    end
  end

  describe 'コメント削除機能' do
    context 'コメントを削除した場合' do
      it 'コメントが削除したものに変更される' do
        visit topicks_path
        task_td = all('tr td')
        task_td[2].click
        # これから削除したいコメントを投稿する ==================
        fill_in 'comment[content]', with: 'あいうえお'
        click_on '登録する'
        # 上で投稿したコメントを削除していく ====================
        click_on 'コメント削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content ''
      end
    end
  end

  


end
