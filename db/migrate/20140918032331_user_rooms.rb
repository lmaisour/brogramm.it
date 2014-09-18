class UserRooms < ActiveRecord::Migration
  def change
  	create_table :user_rooms, :id => false do |t|
      t.integer :user_id
      t.integer :room_id
  	end
  end
end
