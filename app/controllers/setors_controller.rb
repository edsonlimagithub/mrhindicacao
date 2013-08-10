class SetorsController < ApplicationController
  # GET /setors
  # GET /setors.json
  def index
    @setors = Setor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @setors }
    end
  end

  # GET /setors/1
  # GET /setors/1.json
  def show
    @setor = Setor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @setor }
    end
  end

  # GET /setors/new
  # GET /setors/new.json
  def new
    @setor = Setor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @setor }
    end
  end

  # GET /setors/1/edit
  def edit
    @setor = Setor.find(params[:id])
  end

  # POST /setors
  # POST /setors.json
  def create
    @setor = Setor.new(params[:setor])

    respond_to do |format|
      if @setor.save
        format.html { redirect_to @setor, notice: 'Setor was successfully created.' }
        format.json { render json: @setor, status: :created, location: @setor }
      else
        format.html { render action: "new" }
        format.json { render json: @setor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /setors/1
  # PUT /setors/1.json
  def update
    @setor = Setor.find(params[:id])

    respond_to do |format|
      if @setor.update_attributes(params[:setor])
        format.html { redirect_to @setor, notice: 'Setor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @setor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setors/1
  # DELETE /setors/1.json
  def destroy
    @setor = Setor.find(params[:id])
    @setor.destroy

    respond_to do |format|
      format.html { redirect_to setors_url }
      format.json { head :no_content }
    end
  end
end
