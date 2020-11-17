FactoryBot.define do
  factory :product do
    product_name { 'apple' }
    product_detail { 'iphone' }
    price { '100000' }
    category_id { '2' }
    product_condition_id { '2' }
    delivery_fee_id  { '2' }
    area_id { '2' }
    days_to_ship_id { '2' }
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
