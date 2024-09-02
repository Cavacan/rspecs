class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:notice] = "Login successful!"
      redirect_to root_path
    else
      flash[:alert] = "Login failed!"
      render :new
    end
  end

  def destroy
    logout
    flash[:notice] = "Logged out successfully!"
    redirect_to root_path
  end
end
