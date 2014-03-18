class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.integer :venue_id
      t.title :string
      t.description :text
      t.date :datetime
      t.timestamps
    end
  end
end
