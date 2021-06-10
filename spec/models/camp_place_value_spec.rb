require 'rails_helper'

RSpec.describe CampPlaceValue, type: :model do
  describe 'バリデーション' do
    subject(:user) { FactoryBot.create(:user) }
    subject(:camp_place) { FactoryBot.create(:camp_place) }
    subject(:camp_place_value) { FactoryBot.build(:camp_place_value, user_id: user.id, camp_place_id: camp_place.id) }

    it '正常に口コミを投稿できること' do
      expect(camp_place_value).to be_valid
      camp_place_value.save
    end
    context 'user_id' do
      it 'user_idがなければ口コミを投稿できないこと'do
        camp_place_value.user_id = nil
        expect(camp_place_value).to be_invalid
        expect(camp_place_value.save).to be_falsey
      end
    end
    context 'camp_place_id' do
      it 'camp_place_idがなければ口コミを投稿できないこと'do
        camp_place_value.camp_place_id = nil
        expect(camp_place_value).to be_invalid
        expect(camp_place_value.save).to be_falsey
      end
    end
    context 'title' do
      it 'タイトルがなければ登録できないこと' do
        camp_place_value.title = nil
        expect(camp_place_value).to be_invalid
        expect(camp_place_value.save).to be_falsey
      end
      it 'タイトルが30文字以内なら登録できること' do
        camp_place_value.title = 'a' * 30
        expect(camp_place_value).to be_valid
        camp_place_value.save
      end
      it 'タイトルが31文字以上だと登録できないこと' do
        camp_place_value.title = 'a' * 31
        expect(camp_place_value).to be_invalid
        expect(camp_place_value.save).to be_falsey
      end
    end
    context 'rate' do
      it '評価がなければ登録できないこと' do
        camp_place_value.rate = nil
        expect(camp_place_value).to be_invalid
        expect(camp_place_value.save).to be_falsey
      end
    end
  end
end











