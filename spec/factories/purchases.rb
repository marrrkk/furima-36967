FactoryBot.define do
  factory :purchase do
    post_code         { '123-4567' }
    shipping_area_id  { 2 }
    municipalities    { '横浜市' }
    address           { '青山1-1' }
    building          { '東京ハイツ' }
    telephone_number  { '09012345678' }
    token             { 'tok_abcdefghijk00000000000000000' }
  end
end
