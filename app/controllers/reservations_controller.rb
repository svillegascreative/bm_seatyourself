class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.build(params[:reservation])
    datetime = DateTime.civil(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i,
                            params[:date][:hours].to_i, 0, 0)
    @reservation.datetime = datetime

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

end
