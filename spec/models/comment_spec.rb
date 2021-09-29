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

    context '名前が正常に登録されるの場合' do
      it '値が登録される' do
        comment = Comment.new(content: 'おにぎり')
        expect(comment).not_to be_valid
      end
    end

  context '名前が255文字以下の場合' do
    it '値が登録される' do
      comment = Comment.new(content: '1 * 254')
      expect(comment).not_to be_valid
    end
  end
end
  
end

  #   context 'ナレッジの名前が30字の場合' do
  #     it 'バリデーションが通る' do
  #       user = FactoryBot.create(:user)
  #       team = FactoryBot.create(:team, user_id: user.id, owner_id: user.id)
  #       member = FactoryBot.create(:member, user_id: user.id, team_id: team.id)
  #       knowledge = Knowledge.new(name: 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCD', member_id: member.id, team_id: team.id)
  #       expect(knowledge).to be_valid
  #     end
  #   end



