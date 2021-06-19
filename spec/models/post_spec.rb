require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーション' do
    subject(:post) { FactoryBot.build(:post, user_id: user.id) }

    let(:user) { FactoryBot.create(:user) }

    it '正常に登録できること' do
      expect(post).to be_valid
      post.save
    end
    context 'user_id' do
      it 'user_idがなければ登録できないこと' do
        post.user_id = nil
        expect(post).to be_invalid
        expect(post.save).to be_falsey
      end
    end

    context 'title' do
      it 'タイトルがなければ登録できないこと' do
        post.title = nil
        expect(post).to be_invalid
        expect(post.save).to be_falsey
      end
      it 'タイトルが30文字以内なら登録できること' do
        post.title = 'a' * 30
        expect(post).to be_valid
        post.save
      end
      it 'タイトルが31文字以上だと登録できないこと' do
        post.title = 'a' * 31
        expect(post).to be_invalid
        expect(post.save).to be_falsey
      end
    end

    context 'review' do
      it 'reviewが140文字以内なら登録できること' do
        post.review = 'a' * 140
        expect(post).to be_valid
        post.save
      end
      it 'reviewが140文字以上だと登録できないこと' do
        post.review = 'a' * 141
        expect(post).to be_invalid
        expect(post.save).to be_falsey
      end
    end

    context 'image' do
      it 'imageがなければ登録できないこと' do
        post.image = nil
        expect(post).to be_invalid
        expect(post.save).to be_falsey
      end
    end
  end
end
