class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.references :pet, null: false, index: true
    	t.string :url, null: false

    	t.timestamps null: false
    end
  end
end
