class AddSubjectToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :subject, :string
  end
end
