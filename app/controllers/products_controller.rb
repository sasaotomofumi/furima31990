class ProductsController < ApplicationController
  def index 

  end

  def new 
    @product = Product.new
  end

  def create 
    @product = Product.new(product_params)
    @product.save 
    redirect_to root_path
  end

  def show 

  end

  def  exit 

  end

  private 

  def product_params 
    params.require(:product).permit(:product_name, :product_detaili, :price, :category_id, :product_condition_id, :delivery_fee_id, :area_id, :days_to_ship_id, :user_id)
  end
  
end
