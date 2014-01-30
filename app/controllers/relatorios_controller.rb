#enconding: utf-8
require 'rubygems'
require 'fastercsv'
require 'csv'

class RelatoriosController < ApplicationController
	#load_and_authorize_resource 

	def indicacoes_filtro
	end

	def indicacoes
		data_inicial = Date.strptime(params['data-inicial'], "%d/%m/%Y").strftime("%Y-%m-%d")
		data_final   = Date.strptime(params['data-final'], "%d/%m/%Y").strftime("%Y-%m-%d")

		usuario = params[:user_id].blank?     ? "" : " AND user_id = #{params[:user_id]}"       
		setor   = params[:setor_id].blank?    ? "" : " AND setor_id = #{params[:setor_id]}"     
		cliente = params[:cliente_id].blank?  ? "" : " AND cliente_id = #{params[:cliente_id]}" 
		servico = params[:servico_id].blank?  ? "" : " AND servico_id = #{params[:servico_id]}"

		select_status = ''
		if params[:status] != 'todos'
			if params[:status] == 'abertas'
				select_status = 'AND concluida isnull AND cancelado isnull'
			elsif params[:status] == 'concluidas'
				select_status = 'AND concluida = true'
			else
				select_status = 'AND cancelado = true'
			end
				
		end
		
		@indicacoes = Indicacao.find(:all,
		 :conditions => ["created_at between '#{data_inicial}' AND '#{data_final}' #{usuario}#{setor}#{cliente}#{servico} #{select_status}"])

		if params[:saida] == 'planilha'
			gerar_csv @indicacoes
		end
	end

	def gerar_csv indicacoes
		csv_string = CSV.generate do |csv|
			titulos = ["data", "cliente", "indicador", "servico", "situacao"]
			csv << titulos
			indicacoes.each do |indicacao|
				data      = indicacao.created_at.strftime("%d/%m/%Y")
				cliente   = indicacao.cliente.nome
				indicador = indicacao.user.nome
				servico   = indicacao.servico.descricao
				situacao  = indicacao.concluida

				csv << [data, cliente, indicador, servico, situacao]
			end
		end
		filename = "data-#{Time.now.to_date.to_s}.csv"
    	send_data(csv_string, :type => 'text/csv; charset=utf-8; header=present', :filename => filename) 
	end
end
