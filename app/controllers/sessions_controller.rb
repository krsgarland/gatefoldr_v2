class SessionsController < ApplicationController
  before_action :already_signed_in?, except: [:destroy]
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Login Successful!"
      redirect_to albums_path

    else
      flash[:notice] = "Login Failed."
      render :new, status: :unprocessable_entity

    end
  end

  def destroy 
    session[:user_id] = nil
    flash[:notice] = "Logout successful!"
    redirect_to root_path
  end
end
