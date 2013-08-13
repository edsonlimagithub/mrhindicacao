class UserController < ApplicationController
  load_and_authorize_resource 
  def index
  	@users = User.all 
  end

  def new
  	@user = User.new
  end

  def criar_novo
  	user = User.create!(params[:user])
  end
end
