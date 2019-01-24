class RemoveLongitudeAndLatitudeFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :longitude, :string
    remove_column :users, :latitude, :string
  end
end
