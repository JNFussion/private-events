class SessionsController < ApplicationController

  def create
    @user = User.find_by name: params[:username]

    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "#{@user.name} have been log in!"
    else
      render :new, alert: "Invalid name, try again."
    end
  end

  def destroy
    session[:user_id] = nil
    
  end
  
end