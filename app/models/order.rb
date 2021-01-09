class Order < ApplicationRecord
  has_many :ordered_Items, dependent: :destroy
  belongs_to :member
  enum payment_method: {credit_card: 0, bank_transfer: 1}

  def format_postal_code(str)
    self.shipping_postal_code.to_s.insert(3, "-")
  end
end
