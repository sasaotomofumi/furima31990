class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product.id)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @product.destroy if user_signed_in? && current_user.id == @product.user.id
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_detail, :price, :category_id, :product_condition_id, :delivery_fee_id, :area_id, :days_to_ship_id, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
