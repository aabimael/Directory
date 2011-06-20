# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  layout 'main'
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  private
  def authorize
    unless session[:user_id]
      redirect_to(:controller => "secure" , :action => "login" )
    end
  end

  private
  def authorize_admin
    unless session[:user_id] == "admin"
      redirect_to(:controller => "secure" , :action => "login" )
    end
  end

end
