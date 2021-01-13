class ShippingAddress < ApplicationRecord
  belongs_to :member
  validates :shipping_postal_code, presence: true
  validates :shipping_street_address, presence: true
  validates :shipping_name, presence: true

  def shipping_data
    "〒" + self.shipping_postal_code.to_s.insert(3, "-") + " " + self.shipping_street_address + " " + self.shipping_name
  end
end
