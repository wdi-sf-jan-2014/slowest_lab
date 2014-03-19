class AddFollowedIndexToFollows < ActiveRecord::Migration
  def change
    add_index :follows, :followed_id
  end
end
