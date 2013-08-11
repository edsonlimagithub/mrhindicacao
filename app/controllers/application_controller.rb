class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  #load_and_authorize_resource 
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  protect_from_forgery

  def index
  end
end
