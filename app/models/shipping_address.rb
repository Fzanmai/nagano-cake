class ShippingAddress < ApplicationRecord
  belongs_to :customer

  #登録した配送先を、注文情報入力に
  def view_shipping_address
    self.post_code + self.address + self.name
  end

end
