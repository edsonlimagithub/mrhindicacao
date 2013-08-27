class AddColumnsToServicos < ActiveRecord::Migration
  def change
  	#detalhes do serviço
  	add_column :servicos, :detalhes, :text
  	#dias que o serviço será acompanhando antes de vencer a indicação.
  	add_column :servicos, :dias_acompanhamento, :integer
  end
end
