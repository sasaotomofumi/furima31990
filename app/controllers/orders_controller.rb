class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order = OrderShippingAddress.new
    @product = Product.find(params[:product_id])
    redirect_to root_path if current_user.id == @product.user.id
  end

  def create
    @order = OrderShippingAddress.new(order_params)
    if @order.valid?
      pay_order
      @order.save
      redirect_to root_path
    else
      @product = Product.find(params[:product_id])
      render action: :index
    end
  end

  private

  def order_params
    params.permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :product_id).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_order
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Product.find(order_params[:product_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
