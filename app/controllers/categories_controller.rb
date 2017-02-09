class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
