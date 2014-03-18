class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.name :string
      t.description :text
      t.timestamps
    end
  end
end
