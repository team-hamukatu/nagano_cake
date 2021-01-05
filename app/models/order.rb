class Order < ApplicationRecord
  enum payment_method: {credit_card: 0, bank_transfer: 1}
end
