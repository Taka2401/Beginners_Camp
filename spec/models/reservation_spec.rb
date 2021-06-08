require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it "is valid with a id, user_id, camp_place_id, start_date, end_date, payment_method, guest, day, total_fee" do
    reservation = Reservation.new(
      id: "1",
      user_id: "1",
      camp_place_id: "1",
      start_date: "2021/12/01",
      end_date: "2021/12/03",
      payment_method: "クレジットカード",
      guest: "3",
      day: "２泊３日",
      total_fee: "19600"
    )
    expect(reservation).to be_valid
  end

  it "is valid with a id, user_id, camp_place_id, start_date, end_date, payment_method, guest, day, total_fee"
  it "is invalid without a id"
  it "is invalid without a user_id"
  it "is invalid without a camp_place_id"
  it "is invalid without an start_date"

  it "is invalid without a " do
    reservation = Reservation.new(start_date: nil)
    reservation.valid?
    expect(reservation.errors[:start_date]).to include("を入力してください")
  end


end
