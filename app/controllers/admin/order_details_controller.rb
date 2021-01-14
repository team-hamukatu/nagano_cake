class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_administrator!
  
  def update
    
    ordered_item = OrderedItem.find(params[:id])
    ordered_item.update(ordered_item_params)
    #redirect_back(fallback_location: admin_orders_path)
    redirect_to  admin_order_path(ordered_item.order_id)
  end
  
  private
  
  def ordered_item_params
    params.require(:ordered_item).permit(:production_status)
  end
  
end
