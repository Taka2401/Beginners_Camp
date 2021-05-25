class Public::ReservationsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
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

		@checkout = "11:00"
		@reservation.total_fee =  @camp_place.fee

		if @reservation.day == "２泊３日"
		  @camp_place.fee = @camp_place.fee * 2
		  @reservation.total_fee = @reservation.total_fee * 2
		end

		if @reservation.invalid?
			render action: :new
		end

  end

  def edit
    if @reservation.day == '1day'
      @reservation.price = '300000'
    end
  end

  def create
    @camp_place = CampPlace.find(params[:camp_place_id])
    @reservation = Reservation.new(reservation_params)
    reservation = current_user.reservations.new(reservation_params)
    reservation.camp_place_id = @camp_place.id
    reservation.save
    redirect_to camps_path # to edit url
  end

  private

  def reservation_params
    params.require(:reservation).permit(:camp_place_id, :start_date, :total_fee, :guest, :day, :payment_method)
  end

end
