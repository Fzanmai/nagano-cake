class Order < ApplicationRecord
  belongs_to :customer

  enum payment_method: { card: 0, furikomi: 1 }
  enum production_status: { on_payment: 0, paid: 1, under_manufacture: 2, on_shipping: 3, shipped: 4 }
end
