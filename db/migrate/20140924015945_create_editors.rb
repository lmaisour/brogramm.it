class CreateEditors < ActiveRecord::Migration
  def change
    create_table :editors do |t|

      t.timestamps
    end
  end
end
