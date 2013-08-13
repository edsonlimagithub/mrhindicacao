class CreateServicos < ActiveRecord::Migration
  def change
    create_table :servicos do |t|
      t.string :descricao
      t.float :porcentagem

      t.timestamps
    end
  end
end
