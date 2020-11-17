class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :days_to_ship
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true

  validates :product_name, presence: true, length: { maximum: 40 }
  validates :product_detail, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than: 299, less_than: 10_000_000 }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :product_condition_id
    validates :delivery_fee_id
    validates :area_id
    validates :days_to_ship_id
  end
end
