class Public::ItemsController < ApplicationController
  def index
    @items_count = Item.all
    @items = Item.page(params[:page]).reverse_order.per(8)
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
     
  end
end
