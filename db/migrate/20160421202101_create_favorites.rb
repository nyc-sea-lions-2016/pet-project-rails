class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, null: false, index: true
      t.references :pet, null: false, index: true
      
      t.timestamps null: false
    end
  end
end
