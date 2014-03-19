class AddIndexToShows < ActiveRecord::Migration
  def change
    add_index :shows, :user
  end
end
