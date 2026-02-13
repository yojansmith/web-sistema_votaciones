class RemoveUserIdFromVotos < ActiveRecord::Migration[7.1]
  def change
    remove_column :votos, :user_id, :bigint
  end
end
