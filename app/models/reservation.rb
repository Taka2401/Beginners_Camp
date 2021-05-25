class Reservation < ApplicationRecord

  belongs_to :user
  belongs_to :camp_place

  enum payment_method: { "クレジットカード" => 0, "銀行振込" => 1, }

  validates :start_date, presence: true
  
end
