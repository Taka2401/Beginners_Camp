class AddPaymentMethodAndTotalFeeToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :payment_method, :integer
    add_column :reservations, :total_fee, :integer
    add_column :reservations, :guest, :integer
    add_column :reservations, :day, :integer
  end
end
