class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.string :shipping_postal_code
      t.string :shipping_street_address
      t.string :shipping_name
      t.integer :postage
      t.integer :billing_amount
      t.integer :payment_method, default: 0
      t.integer :order_status, default: 0

      t.timestamps
    end
  end
end
