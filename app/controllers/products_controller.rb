class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show 
    @product = Product.find(params[:id])

  end

  def edit 
    @product = Product.find(params[:id])
  end

  def update 
    product = Product.find(params[:id])
    if product.update(product_params)
      redirect_to product_path(product.id)
    else 
      @product = product
      render :edit
    end
  end

  def destroy 

  end

  

  private

  def product_params
    params.require(:product).permit(:product_name, :product_detail, :price, :category_id, :product_condition_id, :delivery_fee_id, :area_id, :days_to_ship_id, :image).merge(user_id: current_user.id)
  end
end
