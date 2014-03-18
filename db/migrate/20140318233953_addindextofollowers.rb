class Addindextofollowers < ActiveRecord::Migration
  def change
    add_index :follows, [:follower_id, :followed_id]
  end
end
