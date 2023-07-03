FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { '2' }
    municipalities { 'うま市' }
    house_number { '1-1-1' }
    building_name { 'ビル101' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
