class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in"
      redirect_to new_session_path
    end
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

# change the calling of this from views:
  def owned_restaurants
    owner = current_user.id
    owner_id = owner.to_i
    owned_restaurants = Restaurant.find(owner_id)
  end

  def restaurant_reservations
    @restaurant_reservations = Reservation.where("restaurant_id = ?", params[:restaurant_id])
  end

  helper_method :restaurant_reservations
  helper_method :find_restaurant
  helper_method :owned_restaurants
  helper_method :current_user

end
