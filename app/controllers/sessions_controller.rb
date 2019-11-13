class SessionsController < ApplicationController
  def new
    @user = true
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to :root, notice: "Logged in!"
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :login, notice: "Logged out!"
  end
end
