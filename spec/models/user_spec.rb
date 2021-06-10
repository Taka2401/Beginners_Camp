require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    it '正常に登録できること' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
      user.save
    end

    context 'name' do
      subject(:user) { FactoryBot.build(:user) }
      it '空白でないこと' do
        user.name = ''
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("を入力してください")
        expect(user.save).to be_falsey
      end
      it '10文字以内であること' do
        user.name = 'a' * 10
        expect(user).to be_valid
        user.save
      end
      it '11文字以上だと登録できないこと' do
        user.name = 'a' * 11
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("は10文字以内で入力してください")
        expect(user.save).to be_falsey
      end
      it 'usernameが重複していても登録できること' do
        FactoryBot.create(:user, name: 'same_name')
        user.name = 'same_name'
        expect(user).to be_valid
        user.save
      end
    end

    context 'email' do
      subject(:user) { FactoryBot.build(:user) }
      it '空白でないこと' do
        user.email = ''
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("を入力してください")
        expect(user.save).to be_falsey
      end
      it '重複して登録できないこと' do
        FactoryBot.create(:user, email: 'test@example.com')
        user.email = 'test@example.com'
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("はすでに存在します")
        expect(user.save).to be_falsey
      end
    end

    context 'password' do
      subject(:user) { FactoryBot.build(:user) }
      it '空白だと登録できないこと' do
        user.password = ''
        expect(user).to be_invalid
        expect(user.errors[:password]).to include("を入力してください")
        expect(user.save).to be_falsey
      end
      it 'passwordが存在しても、password_confirmationが空白だと登録できないこと' do
        user.password_confirmation = ''
        expect(user).to be_invalid
        expect(user.errors[:password_confirmation]).to include("とパスワードが一致しません")
        expect(user.save).to be_falsey
      end
      it 'passwordとpassword_confirmationが一致していないと登録できないこと' do
        user.password = 'password_A'
        user.password_confirmation = 'password_B'
        expect(user).to be_invalid
        expect(user.errors[:password_confirmation]).to include("とパスワードが一致しません")
        expect(user.save).to be_falsey
      end
      it '5文字以下だと登録できないこと' do
        user.password = 'a' * 5
        user.password_confirmation = 'a' * 5
        expect(user).to be_invalid
        expect(user.save).to be_falsey
      end
      it '6文字なら登録できること' do
        user.password = 'a' * 6
        user.password_confirmation = 'a' * 6
        expect(user).to be_valid
        user.save
      end
    end
  end

  describe 'プロフィール' do
    context 'profile_image_id' do
      subject(:user) {FactoryBot.build(:user)}
      it 'nilでも登録できること' do
        user.profile_image_id = nil
        expect(user).to be_valid
        user.save
      end
    end

    context 'introduction' do
      subject(:user) {FactoryBot.build(:user)}
      it 'nilでも登録できること' do
        user.introduction = nil
        expect(user).to be_valid
        user.save
      end
    end
    
  end
end
