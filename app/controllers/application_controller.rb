class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :clear_object_name

  def logged_in_user
  	unless logged_in?
  		flash[:danger] = "Please Log In"
  		redirect_to login_url
  	end
  end

  def clear_object_name
    session.delete(:obj)
  end
end
