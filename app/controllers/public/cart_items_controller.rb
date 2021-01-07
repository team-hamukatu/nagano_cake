class Public::CartItemsController < ApplicationController
  def create
  end

  def index
    @cart_items = CartItem.all
    @cart_item = CartItem.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end
end
