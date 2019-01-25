class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])
    return redirect_to login_url unless @user
    session[:user_id] = @user.id
    redirect_to welcome_url
  end

  def destroy
    session.delete :user_id
    redirect_to root_url
  end
end
