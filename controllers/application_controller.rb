class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def set_current_user
  # we exploit the fact that the below query may return nil
    @current_user ||= Volunteer.find_by_id(session[:user_id])
  #redirect_to login_path and return unless @current_user
  end

  def twitter_redirect
    if params.include?"oauth_token"
      redirect_to ("/volunteers/new?redirect=true")
    else
      redirect_to ("/")
    end
  end
end

