class Reservation < ApplicationRecord

  belongs_to :user
  belongs_to :camp_place, optional: true

  enum day: { "１泊２日" => 0, "２泊３日" => 1}
  enum payment_method: { "クレジットカード" => 0, "銀行振込" => 1, }


  validates :start_date, presence: true
end
