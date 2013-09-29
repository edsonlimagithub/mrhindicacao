module ApplicationHelper
	def date_select_br form
		form.date_select :data, :order => [:day, :month, :year], 
		:use_month_names => ['janeiro', 'fevereiro', 'marco', 'abril', 'maio', 'junho', 'agosto', 
			'setembro', 'outubro', 'novembro', 'dezembro']
	end
end
