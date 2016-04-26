class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :preferred_location
      t.integer :preferred_search_radius
      t.integer :facebook_id, null: false, limit: 8

      t.timestamps null: false
    end
  end
end
