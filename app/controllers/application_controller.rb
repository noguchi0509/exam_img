class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login
  
  private
  
  def require_login
    unless logged_in?
      flash[:danger] = "アクセスするためにはログインしてください"
      redirect_to new_session_path
    end
  end
end