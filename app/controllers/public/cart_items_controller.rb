class Public::CartItemsController < ApplicationController
  before_action :authenticate_member!

  def create
    @cart_item = current_member.cart_items.build(cart_item_params)
    cart_item = current_member.cart_items.find_by(item_id: @cart_item.item_id)
    if cart_item.present?
      new_quantity = cart_item.quantity + @cart_item.quantity
      cart_item.update_attribute(:quantity, new_quantity)
    else
      @cart_item.save
    end
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