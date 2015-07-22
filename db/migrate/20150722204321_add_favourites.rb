class AddFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.references :employer, index: true
      t.references :student, index: true
      t.timestamps null: false
    end
  end
end
