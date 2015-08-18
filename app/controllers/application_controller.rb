class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :delivery_hours

  def delivery_hours
    @delivery_hours = 'fuck it'
  end
end
