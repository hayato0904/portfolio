require 'rails_helper'

RSpec.describe Topick, type: :model do
  

  describe '掲示板のバリデーションテスト' do
    context '名前が空欄の場合' do
      it 'バリデーションエラーになる' do
        topick = Topick.new(content: '')
        expect(topick).not_to be_valid
      end
    end

    context '名前が255文字以上の場合' do
      it 'バリデーションエラーになる' do
      topick = Topick.new(content: '1 * 255') 
        expect(topick).to be_invalid
      end
    end

      context '名前がある場合' do
        it '値が登録される' do
          topick = Topick.new(content: '七味唐辛子')
          expect(topick).not_to be_valid
        end
      end

      context '名前がある場合' do
        it '値が登録される' do
          topick = Topick.new(content: '1 * 255')
          expect(topick).not_to be_valid
        end
      end
  end
end