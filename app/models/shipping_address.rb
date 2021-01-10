class ShippingAddress < ApplicationRecord
  belongs_to :member
  def shipping_data
    "〒" + self.shipping_postal_code.to_s.insert(3, "-") + " " + self.shipping_street_address + " " + self.shipping_name
  end
end
