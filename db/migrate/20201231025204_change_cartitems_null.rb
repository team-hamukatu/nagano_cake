class ChangeCartitemsNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cart_items, :item_id, false
    change_column_null :cart_items, :member_id, false
    change_column_null :cart_items, :quantity, false
  end
end
