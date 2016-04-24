class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :preferred_location
      t.integer :preferred_search_radius

      t.timestamps null: false
    end
  end
end
