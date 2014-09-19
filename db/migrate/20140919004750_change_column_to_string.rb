class ChangeColumnToString < ActiveRecord::Migration
  def change
  	rename_column :rooms, :user_id, :created_by
  end
end
