class Admin::OrdersController < ApplicationController
  before_action :authenticate_administrator!

  def index
    if params[:member_id].blank?

    @orders = Order.all.page(params[:page]).per(10)
    else
    @member = params[:member_id]
    @orders = Order.where(member_id: @member).page(params[:page]).per(10)
    end
  end

  def show
    @order = Order.find(params[:id])
    #@order_item = OrderedItem.find(params[:id])

  end

  def update
    order = Order.find(params[:id])
    order_items = order.ordered_items
    order.update(order_params)

  if order.order_status == "入金確認"
    order_items.each do |order_item|
      order_item.update(production_status: "製作待ち")
    end
  end
    redirect_to admin_order_path(order.id)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
