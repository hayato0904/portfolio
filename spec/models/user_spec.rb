require 'rails_helper'
RSpec.describe 'ユーザモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'ユーザの名前が空の場合' do
      it 'バリデーションに引っかかる' do
        user = User.new(name: '', email: 'user@example.com', password: 'password')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザの名前が30字を超える場合' do
      it 'バリデーションに引っかかる' do
        user = User.new(name: 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCDE', email: 'user@example.com', password: 'password')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザの名前が30字の場合' do
      it 'バリデーションが通る' do
        user = User.new(name: 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCD', email: 'user@example.com', password: 'password')
        expect(user).to be_valid
      end
    end
    context 'ユーザのメールアドレスが空の場合' do
      it 'バリデーションに引っかかる' do
        user = User.new(name: 'user', email: '', password: 'password')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザのメールアドレスが255字を超える場合' do
      it 'バリデーションに引っかかる' do
        user = User.new(name: 'user',
                        email: 'ABC@EFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQR.com', password: 'password')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザのメールアドレスが255字の場合' do
      it 'バリデーションが通る' do
        user = User.new(name: 'user',
                        email: 'ABC@EFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQ.com', password: 'password')
        expect(user).to be_valid
      end
    end
    context 'ユーザのメールアドレスのフォーマットが不正の場合' do
      it 'バリデーションが引っかかる' do
        user = User.new(name: 'user', email: 'user.example.com', password: 'password')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザのパスワードが空の場合' do
      it 'バリデーションが引っかかる' do
        user = User.new(name: 'user', email: 'user@example.com', password: '')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザのパスワードが6字未満の場合' do
      it 'バリデーションが引っかかる' do
        user = User.new(name: 'user', email: 'user@example.com', password: 'passw')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザのパスワードが255字を超える場合' do
      it 'バリデーションが引っかかる' do
        user = User.new(name: 'user', email: 'user@example.com',
                        password: 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUV')
        expect(user).not_to be_valid
      end
    end
  end
end