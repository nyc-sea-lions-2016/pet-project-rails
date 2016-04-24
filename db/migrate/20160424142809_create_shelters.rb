class CreateShelters < ActiveRecord::Migration
  def change
    create_table :shelters do |t|
      t.decimal :longitude
      t.decimal :latitude
      t.string :name
      t.string :email
      t.string :city
      t.string :zip_code
      t.string :petfinder_id
      t.string :phone
    end
  end
end
