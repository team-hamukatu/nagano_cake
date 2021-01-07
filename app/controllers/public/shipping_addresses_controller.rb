class Public::ShippingAddressesController < ApplicationController
  def index
    @shipping_addresses = ShippingAddress.all
    @shipping_address = ShippingAddress.new
  end

  def create
    shipping_address = ShippingAddress.new(shipping_addresse_params)
    shipping_address.member_id = current_member.id
    shipping_address.save
    redirect_to shipping_addresses_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def shipping_addresse_params
    params.require(:shipping_address).permit(:member_id, :shipping_postal_code, :shipping_street_address, :shipping_name)
  end
end
