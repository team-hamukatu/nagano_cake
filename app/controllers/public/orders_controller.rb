class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.member_id = current_member.id
    @shipping_addresses = ShippingAddress.all
  end

  def confirm
    @cart_items = CartItem.all

    shipping_data_selection = params["order"][:shipping]

    if shipping_data_selection == "1" then
      @order = Order.new
      @order.member_id = current_member.id
      @order.shipping_postal_code = current_member.postal_code
      @order.shipping_street_address = @order.member.street_address
      @order.shipping_name = @order.member.first_name + @order.member.last_name


    elsif shipping_data_selection == "2" then
      @order = Order.new
      shipping_address = ShippingAddress.find(params["order"][:shipping_address_id])
      @order.member_id = current_member.id
      @order.shipping_postal_code = shipping_address.shipping_postal_code
      @order.shipping_street_address = shipping_address.shipping_street_address
      @order.shipping_name = shipping_address.shipping_name


    else shipping_data_selection == "3"
      @order = Order.new(order_params)
      @order.member_id = current_member.id
    end

    #金額計算
    #小計
    @amount_without_postage = 0
    @cart_items = @order.member.cart_items
    @cart_items.each do |cart_item|
    @total_price = number_to_currency(cart_item.item.price_without_tax*1.08, unit:"¥", strip_insignificant_zeros: true)

    #商品合計
    @amount_without_postage +=  (cart_item.total_price).to_i
    end

    #請求金額
    @billing_amount = @amount_without_postage + @order.postage

    #最後にordersテーブルへ送料と請求金額データを代入
    @order.postage
    @order.billing_amount = @billing_amount

  end

  def complete
  end

  def create
    order = Order.new(order_params)
    order.member_id = current_member.id
    #金額計算
    #小計
    amount_without_postage = 0
    cart_items = order.member.cart_items
    cart_items.each do |cart_item|
    total_price = number_to_currency(cart_item.item.price_without_tax*1.08, unit:"¥", strip_insignificant_zeros: true)

    #商品合計
    amount_without_postage +=  (cart_item.total_price).to_i
    end
    billing_amount = amount_without_postage + order.postage

    order.postage
    order.billing_amount = billing_amount

    order.save

    #工事中
    #orderd_itemテーブルへデータを保存する
    # ordered_item = OrderdItem.new
    # ordered_item.item_id = cart_items.item.id
    # ordered_item.quantity = cart_items.quantity
    # ordered_item.purchased_price =
    # ordered_item.save

    redirect_to orders_complete_path


  end

  def index
    @orders = Order.where(:member_id, :current_member.id)
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:member_id, :shipping_postal_code, :shipping_street_address, :shipping_name, :payment_method, :order_status)
  end
end
