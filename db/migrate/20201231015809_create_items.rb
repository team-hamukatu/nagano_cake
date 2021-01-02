class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.integer :price_without_tax, null: false
      t.string :item_image_id, null: false
      t.text :item_introduction, null: false
      t.boolean :is_active, :boolean, default: true, null: false

      t.timestamps
    end
  end
end
