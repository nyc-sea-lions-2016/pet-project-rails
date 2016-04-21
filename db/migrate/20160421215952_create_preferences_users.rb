class CreatePreferencesUsers < ActiveRecord::Migration
  def change
    create_table :preferences_users do |t|
      t.references :user, null: false, index: true
      t.references :preference, null: false, index: true

      t.timestamps null: false
    end
  end
end
