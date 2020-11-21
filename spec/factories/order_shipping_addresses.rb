FactoryBot.define do
  factory :order_shipping_address do
    postal_code { '100-1000' }
    area_id { '2' }
    municipality { '東京都' }
    address { '青山1-1' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
