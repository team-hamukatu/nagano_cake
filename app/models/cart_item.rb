class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :member
  
   def addTax(money,rate)
    taxed_money =  (money*rate).round
    return taxed_money
   end
  
   def total_price
		  self.addTax(self.item.price_without_tax,1.08)*self.quantity
   end
  
   def add_item(item_id)
     
    　current_item = cart_items.find_by_item_id(item_id)
	　if current_item
			　current_item.quantity += 1
	　else
			　current_item = cart_items.build(item_id: item_id)
	　end
		　　current_item
　 end
end

