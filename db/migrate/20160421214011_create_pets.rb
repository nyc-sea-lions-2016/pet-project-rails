class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
    	t.integer :petfinder_id, null: false, unique: true
    	t.string :name, null: false
    	t.string :animal, null: false, index: true
    	t.text :description, null: false
    	t.string :age, null: false, index: true
    	t.string :size, null: false, index: true
    	t.string :gender, null: false, index: true
    	t.string :breed, null: false, index: true
    	t.string :altered, null: false
    	t.string :shots, null: false
    	t.string :special_needs, null: false
    	t.string :contact_city, null: false, index: true
    	t.string :contact_zip, null: false, index: true
    	t.string :contact_state, null: false, index: true
    	t.string :contact_name, null: false
    	t.string :contact_email, null: false
    	t.string :contact_phone, null: false
    end
  end
end
