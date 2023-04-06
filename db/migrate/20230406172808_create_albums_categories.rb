class CreateAlbumsCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :albums_categories do |t|
      t.integer :album_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
