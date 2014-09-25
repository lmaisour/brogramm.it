class AddEditorToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :editor, :string
  end
end
