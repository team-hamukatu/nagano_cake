class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.member_id = current_member.id
    @shipping_addresses = ShippingAddress.all
  end

  def confirm

  end

  def complete
  end

  def create
    shipping_data_selection =  Order.find_by(params[:shipping])
    
    if shipping_data_selection == 1
      @order = Order.new
      @order.member_id = current_member.id
      @order.shipping_postal_code = current_member.postal_code
      @order.shipping_street_address = @order.member.street_address
      @order.shipping_name = @order.member.(last_name + first_name)
      @order.postage = "800"
      @order.billing_amount = "1000"
      @order.save

    elsif  shipping_data_selection == 2
      @order = Order.new
      shipping_address = ShippingAddress.find(params[:shipping_address_id])
      binding.pry
      @order.member_id = current_member.id
      @order.shipping_postal_code = shipping_address.postal_code
      @order.shipping_street_address = shipping_address.shipping_street_address
      @order.shipping_name = shipping_address.shipping_name
      @order.postage = "800"
      @order.billing_amount = "2000"
      @order.save

    else shipping_data_selection == 3
      @order = Order.new(orders_params)
      @order.member_id = current_member.id
      @order.postage = "800"
      @order.billing_amount = "3000"
      @order.save
    end
  end

  def index
  end

  def show
  end

  private

  def orders_params
    params.require(:order).permit(:shipping_postal_code, :shipping_street_address, :shipping_name, :payment_method)
  end
end
