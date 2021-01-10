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
  
end

