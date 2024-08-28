class UserSessionsController < ApplicationController
  def index; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_or_back_to root_path
    else
      render :new
    end

    def destroy
      logout
      redirect_to root_path
    end
  end
end
