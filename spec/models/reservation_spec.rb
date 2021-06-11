require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'バリデーション' do
    subject(:user) { FactoryBot.create(:user) }
    subject(:camp_place) { FactoryBot.create(:camp_place) }
    subject(:reservation) { FactoryBot.build(:reservation, user_id: user.id, camp_place_id: camp_place.id) }

    it '正常に予約できること' do
      expect(reservation).to be_valid
      reservation.save
    end
    context 'user_id' do
      it 'user_idがなければ予約できないこと'do
        reservation.user_id = nil
        expect(reservation).to be_invalid
        expect(reservation.save).to be_falsey
      end
    end
    context 'camp_place_id' do
      it 'camp_place_idがなければ予約できないこと'do
        reservation.camp_place_id = nil
        expect(reservation).to be_invalid
        expect(reservation.save).to be_falsey
      end
    end
    context 'start_date' do
      it 'start_dateがなければ予約できないこと'do
        reservation.start_date = nil
        expect(reservation).to be_invalid
        expect(reservation.save).to be_falsey
      end
    end
  end
end
