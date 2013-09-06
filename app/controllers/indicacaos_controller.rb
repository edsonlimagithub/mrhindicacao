class IndicacaosController < ApplicationController
  load_and_authorize_resource
  # GET /indicacaos
  # GET /indicacaos.json
  def index
    @indicacaos = Indicacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @indicacaos }
    end
  end

  # GET /indicacaos/1
  # GET /indicacaos/1.json
  def show
    @indicacao = Indicacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @indicacao }
    end
  end

  # GET /indicacaos/new
  # GET /indicacaos/new.json
  def new
    @indicacao = Indicacao.new
    @indicacao.user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @indicacao }
    end
  end

  # GET /indicacaos/1/edit
  def edit
    @indicacao = Indicacao.find(params[:id])
  end

  # POST /indicacaos
  # POST /indicacaos.json
  def create
    @indicacao = Indicacao.new(params[:indicacao])
    @indicacao.user = current_user
    respond_to do |format|
      if @indicacao.save
        format.html { redirect_to @indicacao, notice: 'Indicacao was successfully created.' }
        format.json { render json: @indicacao, status: :created, location: @indicacao }
      else
        format.html { render action: "new" }
        format.json { render json: @indicacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /indicacaos/1
  # PUT /indicacaos/1.json
  def update
    @indicacao = Indicacao.find(params[:id])

    respond_to do |format|
      if @indicacao.update_attributes(params[:indicacao])
        format.html { redirect_to @indicacao, notice: 'Indicacao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @indicacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indicacaos/1
  # DELETE /indicacaos/1.json
  def destroy
    @indicacao = Indicacao.find(params[:id])
    @indicacao.destroy

    respond_to do |format|
      format.html { redirect_to indicacaos_url }
      format.json { head :no_content }
    end
  end

  def enviar_email
    params[:indicacoes].each do |i, index|
      indicacao = Indicacao.find(i)
      Email.indicacao(indicacao.servico.email).deliver
    end
    render :index
  end
end
