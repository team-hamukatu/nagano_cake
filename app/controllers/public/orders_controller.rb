class Public::OrdersController < ApplicationController
  before_action :authenticate_member!

  def new
    @order = Order.new
    @order.member_id = current_member.id
    @shipping_addresses = ShippingAddress.where(member_id: current_member.id)
  end

  def confirm
    @cart_items = CartItem.where(member_id: current_member.id)
    shipping_data_selection = params["order"][:shipping]

      @order = Order.new(order_params)
      @order.member_id = current_member.id

    if shipping_data_selection == "1" then
      @order.shipping_postal_code = current_member.postal_code
      @order.shipping_street_address = @order.member.street_address
      @order.shipping_name = @order.member.first_name + @order.member.last_name

    elsif shipping_data_selection == "2" then
      shipping_address = ShippingAddress.find(params["order"][:shipping_address_id])
      @order.shipping_postal_code = shipping_address.shipping_postal_code
      @order.shipping_street_address = shipping_address.shipping_street_address
      @order.shipping_name = shipping_address.shipping_name

    else shipping_data_selection == "3"
    end

    #金額計算
    #小計
    @cart_items = @order.member.cart_items
    @amount_without_postage = 0
    @cart_items.each do |cart_item|

    #税込み価格
      price = cart_item.item.price_without_tax*1.08
    #税込み価格 x  数量
      total_price = price*cart_item.quantity

    #商品合計(送料を足す前)
    @amount_without_postage +=  total_price.to_i
    # @amount_without_postage +=  (cart_item.total_price).to_i
    end
    #請求金額(商品合計+送料)
    @billing_amount = @amount_without_postage + @order.postage
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    #金額計算
    #小計
    amount_without_postage = 0
    cart_items = @order.member.cart_items
    cart_items.each do |cart_item|
    total_price = cart_item.item.price_without_tax*1.08

    #商品合計
    amount_without_postage +=  (cart_item.total_price).to_i
    end
    billing_amount = amount_without_postage + @order.postage

    @order.postage
    @order.billing_amount = billing_amount

    @order.save

    # orderd_itemテーブルへデータを保存する

    @order.member.cart_items.each do |cart_item|
    ordered_item = OrderedItem.new
    ordered_item.order_id = @order.id
    ordered_item.item_id = cart_item.item.id
    ordered_item.quantity = cart_item.quantity
    ordered_item.purchased_price = cart_item.item.price_without_tax*1.08
    ordered_item.save
    end

    @order.member.cart_items.destroy_all

    redirect_to orders_complete_path
  end

  def index
    @orders = Order.where(member_id: current_member.id)
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:member_id, :shipping_postal_code, :shipping_street_address, :shipping_name, :payment_method, :order_status)
  end
end