require 'rails_helper'

RSpec.describe PostComment, type: :model do
  describe 'バリデーション' do
    subject(:user) { FactoryBot.create(:user) }
    subject(:post) { FactoryBot.create(:post) }
    subject(:post_comment) { FactoryBot.build(:post_comment, user_id: user.id, post_id: post.id) }

    it '正常にコメントできること' do
      expect(post_comment).to be_valid
      post_comment.save
    end
    context 'user_id' do
      it 'user_idがなければコメントできないこと'do
        post_comment.user_id = nil
        expect(post_comment).to be_invalid
        expect(post_comment.save).to be_falsey
      end
    end
    context 'post_id' do
      it 'post_idがなければコメントできないこと'do
        post_comment.post_id = nil
        expect(post_comment).to be_invalid
        expect(post_comment.save).to be_falsey
      end
    end
    context 'comment' do
      it 'commentがなければコメントできないこと'do
        post_comment.comment = nil
        expect(post_comment).to be_invalid
        expect(post_comment.save).to be_falsey
      end
    end
    context 'comment' do
      it 'commentが140文字以内なら登録できること' do
        post_comment.comment = 'a' * 140
        expect(post_comment).to be_valid
        post_comment.save
      end
      it 'commentが140文字以上だと登録できないこと' do
        post_comment.comment = 'a' * 141
        expect(post_comment).to be_invalid
        expect(post_comment.save).to be_falsey
      end
    end
  end
end
