class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :animal_type, index: true
      t.string :size_preference, index: true
      t.string :age, index: true
      t.string :breed, index: true
      t.string :sex, index: true
      t.string :location, index: true

      t.timestamps null: false
    end
  end
end
