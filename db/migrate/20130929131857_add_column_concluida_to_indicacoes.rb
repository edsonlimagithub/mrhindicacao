class AddColumnConcluidaToIndicacoes < ActiveRecord::Migration
  def change
  	add_column :indicacaos, :concluida, :boolean
  end
end
