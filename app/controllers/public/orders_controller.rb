class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.member_id = current_member.id
    @shipping_addresses = ShippingAddress.all
  end

  def confirm
    @cart_items = CartItem.all
    @cart_items
    shipping_data_selection = params["order"][:shipping]

    if shipping_data_selection == "1" then
      @order = Order.new
      @order.member_id = current_member.id
      @order.shipping_postal_code = current_member.postal_code
      @order.shipping_street_address = @order.member.street_address
      @order.shipping_name = @order.member.first_name + @order.member.last_name
      @order.postage = "800"
      @order.billing_amount = "1000"

    elsif shipping_data_selection == "2" then
      @order = Order.new
      shipping_address = ShippingAddress.find(params["order"][:shipping_address_id])
      @order.member_id = current_member.id
      @order.shipping_postal_code = shipping_address.shipping_postal_code
      @order.shipping_street_address = shipping_address.shipping_street_address
      @order.shipping_name = shipping_address.shipping_name
      @order.postage = "800"
      @order.billing_amount = "2000"

    else shipping_data_selection == "3"
      @order = Order.new(order_params)
      @order.member_id = current_member.id
      @order.postage = "800"
      @order.billing_amount = "3000"
    end
  end

  def complete

  end

  def create
    order = Order.new(order_params)
    order.member_id = current_member.id
    order.postage = "800"
    order.billing_amount = "1000"
    if order.save!
      redirect_to orders_complete_path
    else
      redirect_to orders_confirm_path
    end
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:member_id, :shipping_postal_code, :shipping_street_address, :shipping_name, :payment_method, :order_status)
  end
end
