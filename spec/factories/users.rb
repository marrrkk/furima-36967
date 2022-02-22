FactoryBot.define do
  factory :user do
    nickname               { 'マーク' }
    family_name            { '金子' }
    first_name             { '真' }
    family_name_kana       { 'カネコ' }
    first_name_kana        { 'マ' }
    birth_day              { '19990127' }
    email                  { Faker::Internet.free_email }
    password               { 'mark0127' }
    password_confirmation  { password }
  end
end
