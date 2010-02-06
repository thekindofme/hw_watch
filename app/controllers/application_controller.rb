# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :navigation_for_index, :only => [:index]

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation

  protected
  def navigation_for_index
    @context_sensitive_navigation=[]
    #no context sensitive navigation here, rest of the controllers can add to the above defined array.
  end
end
