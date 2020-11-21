require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  describe '商品購入' do
    before do
      @order_shipping_address = FactoryBot.build(:order_shipping_address)
    end

    it '全ての値が存在すれば商品購入ができること' do
      expect(@order_shipping_address).to be_valid
    end

    it 'postal_codeが空だと商品購入することができないこと' do
      @order_shipping_address.postal_code = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeには-を含めないと商品購入することができないこと' do
      @order_shipping_address.postal_code = 1_001_000
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it 'area_idが空だと商品購入することができないこと' do
      @order_shipping_address.area_id = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include('Area is not a number')
    end
    it 'area_idが1だと商品購入することができないこと' do
      @order_shipping_address.area_id = '1'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include('Area must be other than 1')
    end
    it 'municipalityが空だと商品購入することができないこと' do
      @order_shipping_address.municipality = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'addressが空だと商品購入することができないこと' do
      @order_shipping_address.address = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと商品購入することができないこと' do
      @order_shipping_address.phone_number = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberに-を含めると商品購入することができないこと' do
      @order_shipping_address.phone_number = '090-1234-5678'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include('Phone number is invalid')
    end
    it 'tokenが空だと商品購入することができないこと' do
      @order_shipping_address.token = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
