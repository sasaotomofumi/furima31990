require 'rails_helper'

RSpec.describe Product, type: :model do
  describe Product do
    before do
      @product = FactoryBot.build(:product)
    end

    context '商品出品ができる時' do
      it "product_name,product_detail,price,category_id,product_condition_id,deliver_fee_id,area_id,days_to_ship_id,imageが存在すれば商品出品することができる" do
        expect(@product).to  be_valid
      end
    end

    context '商品出品ができない時' do 
      it 'product_nameが空だと出品できない' do 
        @product.product_name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end
      it 'product_nameが41文字以上だと出品できない' do 
        @product.product_name = 'a' * 41
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name is too long (maximum is 40 characters)")
      end

      it 'product_detailが空だと出品できない' do 
        @product.product_detail = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Product detail can't be blank")
      end
      it 'product_detailが1001文字以上だと出品できない' do 
        @product.product_detail = 'a' * 1001
        @product.valid?
        expect(@product.errors.full_messages).to include("Product detail is too long (maximum is 1000 characters)")
      end
      it 'priceが299以下だと出品できない' do 
        @product.price = "299"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than 299")
      end
      it 'priceが10,000,000以上だと出品できない' do 
        @product.price = 100000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than 10000000")
      end
      it 'priceが空だと出品できない' do 
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'category_idが空だと出品できない' do 
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category is not a number")
      end
      it 'category_idが1だと出品できない' do 
        @product.category_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
      it 'product_condition_idが空だと出品できない' do 
        @product.product_condition_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Product condition is not a number")
      end
      it 'product_condition_idが1だと出品できない' do 
        @product.product_condition_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Product condition must be other than 1")
      end
      it 'delivery_fee_idが空だと出品できない' do 
        @product.delivery_fee_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery fee is not a number")
      end
       it 'delivery_fee_idが1だと出品できない' do 
        @product.delivery_fee_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it 'area_idが空だと出品できない' do 
        @product.area_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Area is not a number")
      end
       it 'area_idが1だと出品できない' do 
        @product.area_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Area must be other than 1")
      end
      it 'days_to_ship_idが空だと出品できない' do 
        @product.days_to_ship_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Days to ship is not a number")
      end
       it 'days_to_ship_idが1だと出品できない' do 
        @product.days_to_ship_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Days to ship must be other than 1")
      end
      it 'imageが空だと出品できない' do 
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

    end
  
  end
end
