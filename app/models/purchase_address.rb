class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :shipping_area_id, :municipalities, :address, :building, :telephone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id
    validates :municipalities
    validates :address
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "can't be blank"}
    validates :token
  end
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_code: post_code, shipping_area_id: shipping_area_id, municipalities: municipalities, address: address, building: building, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end