class AddIndexes < ActiveRecord::Migration
  def change
    add_index :attendances, :user_id
    add_index :attendances, :show_id
    add_index :users, :remember_token
    add_index :users, :email
    add_index :follows, :follower_id
    add_index :follows, :followed_id
    add_index :shows, :venue_id
  end
end
