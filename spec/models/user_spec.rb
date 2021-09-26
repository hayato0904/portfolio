require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user2) }
  let!(:user3) { FactoryBot.create(:user3) }
  describe '' do
    context '' do
      it '' do
        expect(second_user).to be_valid
      end
    end
    context '名前が空欄の場合' do
      it 'バリデーションエラーになる' do
        second_user.name = nil
        expect(second_user).to be_invalid
      end
    end