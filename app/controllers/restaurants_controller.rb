class RestaurantsController < ApplicationController

  helper_method :owned_restaurants
  helper_method :find_restaurant

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = find_restaurant
    @user = current_user
    @owned_restaurants = Restaurant.where("owner_id = ?", params[:id])
  end

  def new
    @restaurant = Restaurant.new
    @reservation = Reservation.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @reservation = Reservation.new

    if @restaurant.save
      redirect_to restaurants_url, notice: "Restaurant saved!"
    else
      flash.now[:alert] = "Unable to save restaurant."
      render :new
    end
  end

  def edit
    @restaurant = find_restaurant
  end

  def update
    @restaurant = find_restaurant

    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurant_url, notice: "Restaurant successfully updated!"
    else
      flash.now[:alert] = "Failed to update restaurant."
      render :edit
    end
  end

  def destroy
    @restaurant = find_restaurant
    @restaurant.destroy
# this needs to redirect to manage restaurants path
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end


  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :price, :description, :capacity)
  end

end
