FactoryBot.define do
  factory :item do
    product_name             { 'あああ' }
    product_description      { 'あああ' }
    category_id              { 2 }
    product_condition_id     { 2 }
    shipping_charges_id      { 2 }
    shipping_area_id         { 2 }
    shipping_days_id         { 2 }
    price                    { '500' }
    association :user
  end
end
