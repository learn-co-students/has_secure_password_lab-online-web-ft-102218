class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    return redirect_to login_url unless @user.save
    session[:user_id] = @user.id
    redirect_to welcome_url
  end

  def welcome
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
