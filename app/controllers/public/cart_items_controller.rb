class Public::CartItemsController < ApplicationController
  
  def create
    @cart_item = current_member.cart_items.build(cart_item_params)
    @cart_items = current_member.cart_items.all
    @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
        new_quantity = cart_item.quantity + @cart_item.quantity
        cart_item.update_attribute(:quantity, new_quantity)
        @cart_item.delete
      end
      end
      @cart_item.save
      redirect_to :cart_items
  end
  
  def index
    @cart_items = CartItem.where(member_id: current_member.id)
  end
  
  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :member_id, :quantity)
  end
end