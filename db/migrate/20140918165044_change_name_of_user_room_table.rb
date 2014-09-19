class ChangeNameOfUserRoomTable < ActiveRecord::Migration

  def change
  	rename_table :user_rooms, :UserRoom
	end

end
