class Item < ApplicationRecord
	  has_one_attached :image
    # attachment :item_image

    has_many :cart_items
    has_many :order_details
    has_many :orders, through: :order_details
    belongs_to :genre

    enum is_active: {"販売中": true, "販売停止中": false }

    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, presence: true

 def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fit: [width, height]).processed
 end

end
