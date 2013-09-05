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
		
		@indicacoes = Indicacao.find(:all,
		 :conditions => ["created_at between '#{data_inicial}' AND '#{data_final}' #{usuario}#{setor}#{cliente}#{servico}"])
	end
end
