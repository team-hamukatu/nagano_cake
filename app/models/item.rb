class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :ordered_items, dependent: :destroy
  belongs_to :genre 
  attachment :item_image, destroy: false
  enum is_active: {販売中: TRUE, 販売停止中: FALSE}
end
