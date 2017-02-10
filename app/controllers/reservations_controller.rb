class ReservationsController < ApplicationController
  before_action do
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def index
    @reservations = @restaurant.reservations
    @restaurant_reservations = Reservation.where("restaurant_id = ?", params[:id])
  end

  def show
    @reservation = find_reservation
    ensure_restaurant_match
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def new
    @reservation = Reservation.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    datetime = DateTime.civil(params[:reservation][:year].to_i, params[:reservation][:month].to_i, params[:reservation][:day].to_i, params[:reservation][:hour].to_i)

    if @restaurant.available?(params[:seats].to_i, datetime) && datetime > Time.zone.now && current_user
      @reservation = Reservation.new(reservation_params)
      @reservation.datetime = datetime
      @reservation.restaurant_id = params[:restaurant_id]
      @reservation.user_id = @user.id
      if @reservation.save
        redirect_to restaurant_reservation_url(@restaurant, @reservation), notice: "Reservation made!"
      end
    elsif @user == nil
      redirect_to new_session_url, notice: "Please log-in to make a reservation."
    else
      redirect_to new_restaurant_reservation_url, alert: "This reservation is unavailable."
    end

  end

  def edit
    @reservation = find_reservation
  end

  def update
    @reservation = find_reservation

    if @reservation.update(reservation_params)
      redirect_to restaurant_reservation_url(@restaurant, @reservation), notice: "Reservation successfully updated!"
    else
      flash.now[:alert] = "Failed to update reservation."
      render :edit
    end
  end

  def destroy
    @reservation = find_reservation
    @reservation.destroy
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

  def ensure_restaurant_match
    if @reservation.restaurant != @restaurant
      not_found
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:seats, :year, :month, :day, :hour)
  end

end
