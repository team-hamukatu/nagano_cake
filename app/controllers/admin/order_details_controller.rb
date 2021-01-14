class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_administrator!

  def update

    ordered_item = OrderedItem.find(params[:id])
    ordered_item.update(ordered_item_params)

#親のordered_itemからアソシエーションの関係を使ってorderのidを引っ張ってくる
#変数orderには変数order_itemの親のデータを代入する

    order = ordered_item.order
    ordered_items = OrderedItem.where(order_id: order.id)

    if ordered_item.production_status == "製作中"
      order.update_attribute(:order_status, "製作中")


    elsif
      ordered_items.each.all? {|ordered_item| ordered_item.production_status == "製作完了" }
      order.update_attribute(:order_status, "発送準備中")
    end

    redirect_back(fallback_location: admin_orders_path)

  end

  private

  def ordered_item_params
    params.require(:ordered_item).permit(:production_status)
  end
end
