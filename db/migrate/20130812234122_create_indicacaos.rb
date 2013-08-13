class CreateIndicacaos < ActiveRecord::Migration
  def change
    create_table :indicacaos do |t|
      t.date :data
      t.integer :usuario_id
      t.integer :cliente_id
      t.integer :servico_id
      t.text :detalhes

      t.timestamps
    end
  end
end
