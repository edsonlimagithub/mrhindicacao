module ApplicationHelper
	def date_select_br form, id
		form.date_select id, :order => [:day, :month, :year], 
		:use_month_names => ['janeiro', 'fevereiro', 'marco', 'abril', 'maio', 'junho', 'agosto', 
			'setembro', 'outubro', 'novembro', 'dezembro'],
		:default => Time.now,
		:end_date => Time.now
	end
end
