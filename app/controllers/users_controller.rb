class UsersController < ApplicationController
  def new
    @user = User.new
    @user.email = "email@example.com"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "New User create successfuly"
      redirect_to login_path
    else
      flash.now[:alert] = "Failed!"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(%i[email password password_confirmation])
  end
end
