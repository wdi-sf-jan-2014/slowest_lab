class AddUserIndexToAttendances < ActiveRecord::Migration
  def change
    add_index :attendances, :user_id
  end
end
