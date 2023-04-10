class UsersController < ApplicationController
  before_action :already_signed_in?, only: [:new, :create] 
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Account was created successfully"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show 
      @user = User.find(params[:id])
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
