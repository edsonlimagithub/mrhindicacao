class AddEmailToServico < ActiveRecord::Migration
  def change
  	add_column :servicos, :email, :string
  end
end
