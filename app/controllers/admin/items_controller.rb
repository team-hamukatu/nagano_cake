class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      redirect_to new_admin_item_path
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :price_without_tax, :item_image, :item_introduction, :is_active)
  end

end
