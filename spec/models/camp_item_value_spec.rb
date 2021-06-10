require 'rails_helper'

RSpec.describe CampItemValue, type: :model do
  describe 'バリデーション' do
    subject(:user) { FactoryBot.create(:user) }
    subject(:camp_item) { FactoryBot.create(:camp_item) }
    subject(:camp_item_value) { FactoryBot.build(:camp_item_value, user_id: user.id, camp_item_id: camp_item.id) }

    it '正常に口コミを投稿できること' do
      expect(camp_item_value).to be_valid
      camp_item_value.save
    end
    context 'user_id' do
      it 'user_idがなければ口コミを投稿できないこと'do
        camp_item_value.user_id = nil
        expect(camp_item_value).to be_invalid
        expect(camp_item_value.save).to be_falsey
      end
    end
    context 'camp_item_id' do
      it 'camp_item_idがなければ口コミを投稿できないこと'do
        camp_item_value.camp_item_id = nil
        expect(camp_item_value).to be_invalid
        expect(camp_item_value.save).to be_falsey
      end
    end
    context 'title' do
      it 'タイトルがなければ登録できないこと' do
        camp_item_value.title = nil
        expect(camp_item_value).to be_invalid
        expect(camp_item_value.save).to be_falsey
      end
      it 'タイトルが30文字以内なら登録できること' do
        camp_item_value.title = 'a' * 30
        expect(camp_item_value).to be_valid
        camp_item_value.save
      end
      it 'タイトルが31文字以上だと登録できないこと' do
        camp_item_value.title = 'a' * 31
        expect(camp_item_value).to be_invalid
        expect(camp_item_value.save).to be_falsey
      end
    end
    context 'rate' do
      it '評価がなければ登録できないこと' do
        camp_item_value.rate = nil
        expect(camp_item_value).to be_invalid
        expect(camp_item_value.save).to be_falsey
      end
    end
  end
end