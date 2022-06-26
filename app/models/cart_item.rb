class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  def subtotal
    item.add_tax_price * quantity
  end

  def add_tax_price
    (self.price * 1.1).round
  end

end

