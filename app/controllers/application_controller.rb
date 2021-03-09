class ApplicationController < ActionController::Base

  private

  def require_login
    unless current_user
      redirect_to log_in_path, alert: "Sign up or Log in to see the events!"
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
