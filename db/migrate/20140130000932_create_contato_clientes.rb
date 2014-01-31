class CreateContatoClientes < ActiveRecord::Migration
  def change
    create_table :contato_clientes do |t|
      t.integer :cliente_id
      t.string :nome
      t.string :fone

      t.timestamps
    end
  end
end
