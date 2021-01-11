class ChangeDefaultForPostageTo800OnOrders < ActiveRecord::Migration[5.2]
  def change
    change_column_default :orders, :postage, 800
  end
end
