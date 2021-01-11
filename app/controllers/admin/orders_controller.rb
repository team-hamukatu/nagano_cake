class Admin::OrdersController < ApplicationController
  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @oder_item = OrderedItem.find(params[:id])
    @ordered_items = OrderedItem.where(member_id: current_member.id)
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
