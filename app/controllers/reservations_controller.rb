class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new(reservation_params)
    datetime = DateTime.civil(params[:reservation][:year].to_i, params[:reservation][:month].to_i, params[:reservation][:day].to_i, params[:reservation][:hour].to_i)
    @reservation.datetime = datetime
    @reservation.restaurant_id = params[:restaurant_id]

    if @reservation.save
      redirect_to restaurants_url, notice: "Reservation made!"
    else
      flash.now[:alert] = "Unable to make reservation."
      render :new
    end

  end

  def update
  end

  def destroy
  end

  private

# this helper method maybe needs to go in applications_controller:
  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:seats, :year, :month, :day, :hour)
  end

end
