require 'rails_helper'

RSpec.describe Comment, type: :model do
  

  describe 'コメントバリデーションテスト' do
    context '名前が空欄の場合' do
      it 'バリデーションエラーになる' do
        comment = Comment.new(content: '')
        expect(comment).not_to be_valid
      end
    end

    context '名前が255文字以上の場合' do
      it 'バリデーションエラーになる' do
      comment = Comment.new(content: '1 * 255') 
        expect(comment).to be_invalid
      end
    end
  end
end