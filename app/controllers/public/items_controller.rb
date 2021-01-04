class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).reverse_order
  end

  def show
    @item = Item.find(params[:id])
  end
end
