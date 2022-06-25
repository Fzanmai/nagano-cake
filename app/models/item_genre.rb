class ItemGenre < ApplicationRecord

	has_many :items, dependent: :destroy
	has_many :order_details

  validates :name, presence: { message: 'を選択してください。' }

end
