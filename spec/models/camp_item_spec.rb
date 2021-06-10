require 'rails_helper'

RSpec.describe CampItem, type: :model do
  describe 'バリデーション' do
    subject(:admin) { FactoryBot.create(:admin) }
    subject(:camp_item) { FactoryBot.build(:camp_item, admin_id: admin.id) }

    it '正常にキャンプ場を投稿できること' do
      expect(camp_item).to be_valid
      camp_item.save
    end
    context 'admin_id' do
      it 'admin_idがなければ投稿できないこと'do
        camp_item.admin_id = nil
        expect(camp_item).to be_invalid
        expect(camp_item.save).to be_falsey
      end
    end
    context 'name' do
      it 'キャンプ用品名がなければ登録できないこと' do
        camp_item.name = nil
        expect(camp_item).to be_invalid
        expect(camp_item.save).to be_falsey
      end
    end
    context 'introduction' do
      it '紹介文がなければ登録できないこと' do
        camp_item.introduction = nil
        expect(camp_item).to be_invalid
        expect(camp_item.save).to be_falsey
      end
      it '紹介文が500文字以内なら登録できること' do
        camp_item.introduction = 'a' * 500
        expect(camp_item).to be_valid
        camp_item.save
      end
      it '紹介文が501文字以上だと登録できないこと' do
        camp_item.introduction = 'a' * 501
        expect(camp_item).to be_invalid
        expect(camp_item.save).to be_falsey
      end
     context 'image' do
      it 'キャンプ用品名がなければ登録できないこと' do
        camp_item.image = nil
        expect(camp_item).to be_invalid
        expect(camp_item.save).to be_falsey
        end
      end
    end
  end
end
