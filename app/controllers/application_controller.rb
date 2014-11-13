class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  # http://blog.remarkablelabs.com/2012/12/register-your-own-flash-types-rails-4-countdown-to-2013
  add_flash_types :danger, :success, :warning
  before_action :set_html_safe


  private
    def set_html_safe
      flash.now[:success] = flash[:success].html_safe if flash[:html_safe] && flash[:success]
    end
end
