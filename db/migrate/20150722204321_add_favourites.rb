class AddFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.references :organization, index: true
      t.references :student, index: true
      t.timestamps null: false
    end
  end
end
