class Item < ApplicationRecord
	  has_one_attached :item_image
    # attachment :item_image

    has_many :cart_items
    belongs_to :item_genre

    def add_tax_price
    (self.price * 1.1).round
    end

    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, presence: true

 def get_item_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      item_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_limit: [width, height]).processed
 end

end
