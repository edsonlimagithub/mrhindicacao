class AddCnpjToClientes < ActiveRecord::Migration
  def change
  	add_column :clientes, :cnpj, :string
  end
end
