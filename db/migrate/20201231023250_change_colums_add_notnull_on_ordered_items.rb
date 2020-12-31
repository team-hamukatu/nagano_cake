class ChangeColumsAddNotnullOnOrderedItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :ordered_items, :order_id, false
    change_column_null :ordered_items, :item_id, false
    change_column_null :ordered_items, :quantity, false
    change_column_null :ordered_items, :purchased_price, false
    change_column_null :ordered_items, :production_status, false
  end
end
