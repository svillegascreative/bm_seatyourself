class RestaurantsController < ApplicationController

  helper_method :owned_restaurants
  helper_method :find_restaurant

  def index
    @restaurants = Restaurant.all
    @owners = User.where(owner: true)
      # below is method to easily call owner id -- not used but saved just in case:
      # @owner.each do |user|
      # @restaurant_owner_id = user.id
      # end
  end

  def show
    @restaurant = find_restaurant
    @user = current_user
    # @owned_restaurants = Restaurant.where("owner_id = ?", params[:id])
    @reservations = @restaurant.reservations
    @owners = User.where(owner: true)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @categories = Category.all

    if @restaurant.save
      redirect_to restaurants_url, notice: "Restaurant saved!"
    else
      flash.now[:alert] = "Unable to save restaurant."
      render :new
    end
  end

  def edit
    @restaurant = find_restaurant
    @user = current_user
    unless current_user.id == @restaurant.user_id
      redirect_to restaurants_url, :alert => "Access denied."
    end
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
    redirect_to restaurant_url, notice: "Restaurant destroyed!"
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :capacity, :phone, :description, :website, :user_id, :category_id)
  end

end
