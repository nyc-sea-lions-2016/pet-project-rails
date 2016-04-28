class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :preferred_location
      t.decimal :facebook_id, null: false, limit: 8
      t.string :token
      t.string :profile_pic
      t.string :animal_preference

      t.timestamps null: false
    end
  end
end
