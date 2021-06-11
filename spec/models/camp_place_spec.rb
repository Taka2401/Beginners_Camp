require 'rails_helper'

RSpec.describe CampPlace, type: :model do
  describe 'バリデーション' do
    subject(:admin) { FactoryBot.create(:admin) }
    subject(:camp_place) { FactoryBot.build(:camp_place, admin_id: admin.id) }

    it '正常にキャンプ場を投稿できること' do
      expect(camp_place).to be_valid
      camp_place.save
    end
    context 'admin_id' do
      it 'admin_idがなければ投稿できないこと'do
        camp_place.admin_id = nil
        expect(camp_place).to be_invalid
        expect(camp_place.save).to be_falsey
      end
    end
    context 'name' do
      it 'キャンプ場名がなければ登録できないこと' do
        camp_place.name = nil
        expect(camp_place).to be_invalid
        expect(camp_place.save).to be_falsey
      end
    end
    context 'introduction' do
      it '紹介文がなければ登録できないこと' do
        camp_place.introduction = nil
        expect(camp_place).to be_invalid
        expect(camp_place.save).to be_falsey
      end
      it '紹介文が500文字以内なら登録できること' do
        camp_place.introduction = 'a' * 500
        expect(camp_place).to be_valid
        camp_place.save
      end
      it '紹介文が501文字以上だと登録できないこと' do
        camp_place.introduction = 'a' * 501
        expect(camp_place).to be_invalid
        expect(camp_place.save).to be_falsey
      end
    end
    context 'address' do
      it '住所がなければ登録できないこと' do
        camp_place.address = nil
        expect(camp_place).to be_invalid
        expect(camp_place.save).to be_falsey
      end
    end
    context 'fee' do
      it '利用料金がなければ登録できないこと' do
        camp_place.fee = nil
        expect(camp_place).to be_invalid
        expect(camp_place.save).to be_falsey
      end
    end
    context 'post_images_images' do
      it '画像がなければ登録できないこと' do
        camp_place.post_images = []
        expect(camp_place).to be_invalid
        expect(camp_place.save).to be_falsey
      end
    end
  end
end














