class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  validates :product_name, :product_description, :category_id, :product_condition_id, :shipping_charges_id, :shipping_area_id, :shipping_days_id, :price, :user, presence: true

  validates :category_id, :product_condition_id, :shipping_charges_id, :shipping_area_id, :shipping_days_id, numericality: { other_than: 1, message: "can't be blank"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charges
  belongs_to :shipping_area
  belongs_to :shipping_days
end

