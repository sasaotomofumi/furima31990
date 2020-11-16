class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :days_to_ship


  validates :product_name, :product_detail, :price, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :product_condition_id
    validates :delivery_fee_id
    validates :area_id
    validates :days_to_ship_id
  end


end
