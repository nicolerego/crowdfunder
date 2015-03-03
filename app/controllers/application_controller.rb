class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :require_login

  skip_before_filter :require_login, only: [:index, :new, :create]

  skip_before_filter :require_login, except: [:destroy]

  protect_from_forgery with: :exception

  private
  def not_authenticated
  	redirect_to login_path, alert: "Please login first!"
  end 

end
