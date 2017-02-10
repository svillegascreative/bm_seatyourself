class UsersController < ApplicationController

  def index
    render :layout => "application"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to restaurants_path, notice: "Signed up!!"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @owned_restaurants = Restaurant.where("owner_id = ?", params[:id])
    @restaurant = Restaurant.all
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :owner, :name)
  end
end
