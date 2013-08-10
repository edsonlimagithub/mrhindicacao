class AddColunsInUser < ActiveRecord::Migration
  def up
  	add_column :users, :role_id, :integer
  	add_column :users, :setor_id, :integer
  	add_column :users, :telefone, :string
  	add_column :users, :nome, :string
  end

  def down
  	remove_column :users, :role_id
  	remove_column :users, :setor_id
  	remove_column :users, :telefone
  	remove_column :users, :nome
  end
end
