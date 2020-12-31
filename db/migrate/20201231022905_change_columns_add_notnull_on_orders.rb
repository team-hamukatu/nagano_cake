class ChangeColumnsAddNotnullOnOrders < ActiveRecord::Migration[5.2]
  def change
    change_column_null :orders, :member_id, false
    change_column_null :orders, :shipping_postal_code, false
    change_column_null :orders, :shipping_street_address, false
    change_column_null :orders, :shipping_name, false
    change_column_null :orders, :postage, false
    change_column_null :orders, :billing_amount, false
    change_column_null :orders, :payment_method, false
    change_column_null :orders, :order_status, false
  end
end
