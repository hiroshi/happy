# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  def current_guest
    @current_guest ||= Person.find_by_id(session[:guest_id]) || Person.find_or_create_by_session_key(session[:session_id])
  end
  helper_method :current_guest
end
