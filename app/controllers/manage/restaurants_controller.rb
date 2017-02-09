class Manage::RestaurantsController < ApplicationController

  def show
    render :new
  end

  def index
    render :new
  end

  def new
    @new_restaurant = Restaurant.new
  end

  def edit
    render :new
  end

end
