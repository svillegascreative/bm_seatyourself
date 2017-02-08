class ReservationsController < ApplicationController

  def show
  end

  def create
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
