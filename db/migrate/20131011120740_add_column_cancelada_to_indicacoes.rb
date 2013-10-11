class AddColumnCanceladaToIndicacoes < ActiveRecord::Migration
  def change
  	add_column :indicacaos, :cancelado, :boolean
  end
end
