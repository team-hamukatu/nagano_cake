class CreateOrderedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :quantity
      t.integer :purchased_price
      t.integer :production_status, default: 0

      t.timestamps
    end
  end
end
