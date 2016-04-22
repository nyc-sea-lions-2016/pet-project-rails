class Photos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :pet, index: true
      t.string :url

      t.timestamps null: false
    end
  end
end
