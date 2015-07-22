class AddPosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :organization, index: true
      t.string :title
      t.string :content
      t.timestamps null: false
    end
  end
end
