class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum order_status: { not_possible: 0, awaiting_manufacture: 1, under_manufacture: 2, finish: 3 }

  def subtotal
    item.add_tax_price * quantity
  end

  def total
    item.add_tax_price * quantity
  end

end
