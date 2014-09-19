class DeleteUserRoomTable < ActiveRecord::Migration
  def change
  	drop_table :user_rooms
  end
end
