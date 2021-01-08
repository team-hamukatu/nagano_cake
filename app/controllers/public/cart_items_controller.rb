class Public::CartItemsController < ApplicationController
  
  def create
   
  　cart_item = CartItem.new(cart_item_params)
   
  　cart_item.member_id = current_member.id

  　cart_item.save
  end
  
  def index
    @cart_items = CartItem.all
  end
  
  def add_item
    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(product_id: params[:product_id])
    end

    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to current_cart
  end

  def update
     item = Item.find(params[:item_id])
  cart_item = CartItem.new(cart_item_params)
  cart_item.item_id = item.id
  cart_item.member_id = 1
  cart_item.quantity = item.quantity
  cart_item.save
  end

  def destroy
     @cart_item.destroy
     redirect_to current_cart
  end

  def destroy_all
  end
  
  private

  def cart_item_params
   
    params.require(:cart_item).permit(:item_id, :member_id, :quantity)
  
  end
end
