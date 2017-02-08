class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to restaurants_path, notice: "Logged in!"
      #redirecting to user_path which is our dashboard
    else
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to restaurants_path, notice: "Logged out!"
  end
end
