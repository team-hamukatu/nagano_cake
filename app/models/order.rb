class Order < ApplicationRecord
  enum payment_method: {credit_card: 0, bank_transfer: 1}
 belongs_to :member
 has_many :oder_items, dependent: :destroy
 
 enum production_status:  {着手不可: 0,制作待ち:1,制作中:2,制作完了:3}
 enum order_status: {入金待ち: 0,入金確認:1,制作中:2,発送準備中:3, 発送済み:4}
end
