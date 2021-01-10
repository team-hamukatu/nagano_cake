class Order < ApplicationRecord
  has_many :ordered_tems, dependent: :destroy
  belongs_to :member
  enum payment_method: {クレジットカード:0, 銀行振込:1}

end
