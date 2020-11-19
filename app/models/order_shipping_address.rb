class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :product_id, :user_id
  
  with_options presence: true do 
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /[0-9]{11}/}
  end

  validates :area_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    ShippingAddress.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
