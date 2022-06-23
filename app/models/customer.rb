class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum is_active: {Available: true, Invalid: false}

  def active_for_authentication?
    super && (self.is_active === "Available")
  end
  has_many :orders
  has_many :shipping_addresses, dependent: :destroy
end
