require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'バリデーション' do
    it '正常に登録できること' do
      admin = FactoryBot.build(:admin)
      expect(admin).to be_valid
      admin.save
    end
    
  context 'email' do
      subject(:admin) { FactoryBot.build(:admin) }
      it '空白でないこと' do
        admin.email = ''
        expect(admin).to be_invalid
        expect(admin.errors[:email]).to include("を入力してください")
        expect(admin.save).to be_falsey
      end
      it '重複して登録できないこと' do
        FactoryBot.create(:admin, email: 'test@example.com')
        admin.email = 'test@example.com'
        expect(admin).to be_invalid
        expect(admin.errors[:email]).to include("はすでに存在します")
        expect(admin.save).to be_falsey
      end
    end

    context 'password' do
      subject(:admin) { FactoryBot.build(:admin) }
      it '空白だと登録できないこと' do
        admin.password = ''
        expect(admin).to be_invalid
        expect(admin.errors[:password]).to include("を入力してください")
        expect(admin.save).to be_falsey
      end
      it '5文字以下だと登録できないこと' do
        admin.password = 'a' * 5
        expect(admin).to be_invalid
        expect(admin.save).to be_falsey
      end
      it '6文字なら登録できること' do
        admin.password = 'a' * 6
        admin.password_confirmation = 'a' * 6
        expect(admin).to be_valid
        admin.save
      end
    end
  end
end

