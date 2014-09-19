class ChangeBackNameOfUserRoomTable < ActiveRecord::Migration

  def change
  	rename_table :UserRoom, :user_rooms
	end
end
