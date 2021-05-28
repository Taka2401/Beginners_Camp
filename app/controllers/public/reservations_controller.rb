class Public::ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @reservations = @user.reservations.page(params[:page]).per(1)
    @checkout = "11:00"
  end

  def show
    @user = User.find(params[:user_id])
    @reservation = Reservation.find(params[:id])
    @checkout = "11:00"
  end

  def new
    @reservation = Reservation.new
    @camp_place = CampPlace.find(params[:camp_place_id])
    @checkout = "11:00"
  end

  def confirm
    @camp_place = CampPlace.find(params[:camp_place_id])
		@reservation = Reservation.new
		@reservation.user_id = current_user.id
		@reservation.day =  params[:reservation][:day]
		@reservation.guest =  params[:reservation][:guest]
		@reservation.total_fee =  params[:reservation][:total_fee]
		@reservation.start_date =  params[:reservation][:start_date]
		@reservation.payment_method = params[:reservation][:payment_method]

		@reservation.total_fee =  @camp_place.fee

		year = @reservation.start_date.year
		month = @reservation.start_date.month
		day = @reservation.start_date.day

		if @reservation.day == "２泊３日"
		  @camp_place.fee = @camp_place.fee * 2
		  @reservation.total_fee = @reservation.total_fee * 2
		  @reservation.end_date = Time.zone.parse("#{year}-#{month}-#{day + 2} 11:00")
		else
		  @reservation.end_date = Time.zone.parse("#{year}-#{month}-#{day + 1} 11:00")
		end

		if @reservation.invalid?
			render action: :new
		end

  end

  def create
    @camp_place = CampPlace.find(params[:camp_place_id])
    @reservation = Reservation.new(reservation_params)
    reservation = current_user.reservations.new(reservation_params)
    reservation.camp_place_id = @camp_place.id
    reservation.save
    redirect_to camps_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:camp_place_id, :start_date, :end_date, :total_fee, :guest, :day, :payment_method)
  end

end
