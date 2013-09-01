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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Usuario alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    redirect_to '/user'
  end

end
