class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  
  #load_and_authorize_resource.inspect
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Acesso negado!"
  	redirect_to root_url
  end
  
  protect_from_forgery

  def index
  end

end
