class RenUsuarioIdToUserIdInIndicacao < ActiveRecord::Migration
  def up
  	rename_column :indicacaos, :usuario_id, :user_id
  end

  def down
  	rename_column :indicacaos, :user_id, :usuario_id
  end
end
