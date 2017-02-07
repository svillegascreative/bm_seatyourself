class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = find_restaurant
    @user = current_user
    @reservation = Reservation.new
  end

  def update

  end

  def create

  end

  def destroy
    @restaurant = find_restaurant
    @restaurant.destroy
# this needs to redirect to manage restaurants path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :price, :description, :capacity)
  end

# this helper method maybe needs to go in applications_controller:
  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
