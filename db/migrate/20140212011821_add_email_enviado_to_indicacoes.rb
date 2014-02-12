class AddEmailEnviadoToIndicacoes < ActiveRecord::Migration
  def change
  	add_column :indicacaos, :email_enviado, :integer 
  end
end
