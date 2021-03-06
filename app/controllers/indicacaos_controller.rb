class IndicacaosController < ApplicationController
  load_and_authorize_resource
  # GET /indicacaos
  # GET /indicacaos.json
  def index
    if current_user.role.descricao == 'administrador'
      @indicacaos = Indicacao.find(:all, :conditions => ["concluida IS NOT TRUE AND cancelado IS NOT TRUE"])
    else
      @indicacaos = Indicacao.find(:all, 
        :conditions => ["user_id = ? AND concluida IS NOT TRUE AND cancelado IS NOT TRUE", current_user.id])
    end

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

    if params[:concluida]
      if params[:concluida][:concluida] == 'cancelado'
        @indicacao.cancelado = 'true'
        @indicacao.concluida = nil
      end
      if params[:concluida][:concluida] == 'concluida'
        @indicacao.concluida = 'true'
        @indicacao.cancelado = nil
      end
    end

    respond_to do |format|
      if @indicacao.save
        if params[:enviar_email]
          Email.nova_indicacao('visitas@mrhgestao.com.br', @indicacao).deliver
          Email.nova_indicacao(@indicacao.servico.email, @indicacao).deliver
        end
        format.html { redirect_to @indicacao, notice: 'Indicacao criada com sucesso.' }
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
    if params[:concluida][:concluida] == 'cancelado'
      params[:indicacao][:cancelado] = 'true'
      params[:indicacao][:concluida] = nil
    end
    if params[:concluida][:concluida] == 'concluida'
      params[:indicacao][:concluida] = 'true'
      params[:indicacao][:cancelado] = nil
    end

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
      Email.indicacao('visitas@mrhgestao.com.br', indicacao).deliver
      Email.indicacao(indicacao.servico.email, indicacao).deliver
      
      indicacao.email_enviado = indicacao.email_enviado.to_i + 1
      indicacao.save
    end
    render :index
  end

  def finalizadas
    @indicacaos = Indicacao.find(:all, :conditions => ["concluida IS TRUE AND cancelado IS NOT TRUE"])
  end
end
