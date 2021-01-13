class Admin::OrdersController < ApplicationController
  before_action :authenticate_administrator!
  
  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    #@order_item = OrderedItem.find(params[:id])

  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path(order.id)


  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
