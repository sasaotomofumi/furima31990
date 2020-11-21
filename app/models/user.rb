class User < ApplicationRecord
  has_many :products
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :birth_day
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' } do
    validates :first_name
    validates :family_name
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters' } do
    validates :first_name_kana
    validates :family_name_kana
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
