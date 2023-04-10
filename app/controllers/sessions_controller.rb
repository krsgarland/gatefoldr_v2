class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      flash[:notice] = "Login Successful!"
      redirect_to albums_path

    else
      flash[:notice] = "Login Failed."
      render :new, status: :unprocessable_entity

    end
  end
end
