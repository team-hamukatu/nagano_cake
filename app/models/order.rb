class Order < ApplicationRecord
  has_many :ordered_Items, dependent: :destroy
  belongs_to :member
  enum payment_method: {credit_card: 0, bank_transfer: 1}
end
