class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :camp_place

  enum day: { "１泊２日" => 0, "２泊３日" => 1 }
  enum payment_method: { "クレジットカード" => 0, "銀行振込" => 1 }

  validates :start_date, presence: true, uniqueness: true
  validates :end_date, uniqueness: true

  validate :date_before_start

  def date_before_start
    errors.add(:start_date, "は今日以降のものを選択してください") if
    start_date && (start_date < Time.now - 1.minutes)
  end

end
