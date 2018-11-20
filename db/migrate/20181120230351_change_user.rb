class ChangeUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :chat_rooms, :users_id, :user_id
    rename_column :messages, :users_id, :user_id
  end
end
