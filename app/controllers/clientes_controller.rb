#coding: utf-8
class ClientesController < ApplicationController
  #load_and_authorize_resource
  # GET /clientes
  # GET /clientes.json
  def index
    @clientes = Cliente.all
  end

  def index_modal
    @clientes = Cliente.all
    render :layout => false
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
    @cliente = Cliente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cliente }
    end
  end

  # GET /clientes/new
  # GET /clientes/new.json
  def new
    @cliente = Cliente.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cliente }
    end
  end

  def novo_modal
    @cliente = Cliente.new
    render layout: false
  end

  def create_modal
    cliente = Cliente.new(:nome => params[:nome],
     :cnpj => params[:cnpj],
     :contato => params[:contato], 
     :telefone => params[:telefone],
     :email => params[:email],
     :observacao => params[:observacao])
    cliente.save
    render json: cliente

  end

  # GET /clientes/1/edit
  def edit
    @cliente = Cliente.find(params[:id])
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(params[:cliente])
    respond_to do |format|
      if @cliente.save
        if params[:contato]
          params[:contato].each do |i, contato|
            contatoCliente            = ContatoCliente.new
            contatoCliente.cliente_id = @cliente.id
            contatoCliente.nome       = contato[:nome]
            contatoCliente.fone       = contato[:fone]
            contatoCliente.save 
          end
        end
        format.html { redirect_to @cliente, notice: 'Cliente was successfully created.' }
        format.json { render json: @cliente, status: :created, location: @cliente }
      else
        format.html { render action: "new" }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clientes/1
  # PUT /clientes/1.json
  def update
    @cliente = Cliente.find(params[:id])

    respond_to do |format|
      if @cliente.update_attributes(params[:cliente])
        @cliente.contato_clientes.destroy

        if params[:contato]
          params[:contato].each do |i, contato|
            contatoCliente            = ContatoCliente.new
            contatoCliente.cliente_id = @cliente.id
            contatoCliente.nome       = contato[:nome]
            contatoCliente.fone       = contato[:fone]
            contatoCliente.save
          end
        end
        format.html { redirect_to @cliente, notice: 'Cliente was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @cliente = Cliente.find(params[:id])
    begin
      @cliente.destroy
    rescue ActiveRecord::DeleteRestrictionError => e
      flash[:error] = 'Cliente não pode ser excluído. Existem indicaçãoes para ele'
    end

    respond_to do |format|
      format.html { redirect_to clientes_url }
      format.json { head :no_content }
    end
  end
end
