class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
    @restaurant_reservations = Reservation.where("restaurant_id = ?", params[:restaurant_id])

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
        redirect_to restaurants_url, notice: "Reservation made!"
      end
    elsif @user == nil
      redirect_to new_session_url, notice: "Please log-in to make a reservation."
    else
      redirect_to new_restaurant_reservation_url, notice: "This reservation is unavailable."
    end

  end

  def update
    @reservation = find_reservation

    if @reservation.update_attributes(reservation_params)
      redirect_to restaurant_url, notice: "Reservation successfully updated!"
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

  private

  def reservation_params
    params.require(:reservation).permit(:seats, :year, :month, :day, :hour)
  end

end
