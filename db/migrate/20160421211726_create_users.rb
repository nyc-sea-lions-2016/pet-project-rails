class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :preferred_location
      t.integer :preferred_search_radius
      t.decimal :facebook_id, null: false
      t.string :token
      t.string :profile_pic

      t.timestamps null: false
    end
  end
end
