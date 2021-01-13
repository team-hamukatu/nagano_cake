class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_administrator!

  def update

    ordered_item = OrderedItem.find(params[:id])
    ordered_item.update(ordered_item_params)


    #製作ステータス
    order_status = ordered_item.order.order_status
    order = Order.find_by(params[:id])
    if ordered_item.production_status == "制作中"
      order.update_attributes(order_status: 2)
    end

    redirect_back(fallback_location: admin_orders_path)
    #redirect_to  admin_order_path(ordered_item.order_id)
  end

  private

  def ordered_item_params
    params.require(:ordered_item).permit(:production_status)
  end
end
