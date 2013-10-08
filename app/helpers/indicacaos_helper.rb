module IndicacaosHelper
	def dias_corridos indicacao
		today = Time.now
		(today.to_date - indicacao.created_at.to_date).to_i 
	end
end
