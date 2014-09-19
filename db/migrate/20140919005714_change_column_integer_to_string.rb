class ChangeColumnIntegerToString < ActiveRecord::Migration
  def change
  	change_column :rooms, :created_by, :string
  end
end
