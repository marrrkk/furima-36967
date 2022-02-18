class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  validates :product_name, :product_description, :category_id, :product_condition_id, :shipping_charges_id, :shipping_area_id, :shipping_days_id, :price, :user, presence: true
end
