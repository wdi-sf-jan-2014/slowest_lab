class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.integer :show_id
      t.timestamps
    end
    add_index :attendances, :user_id
    add_index :attendances, :show_id
  end
end
