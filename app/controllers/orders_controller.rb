class OrdersController < ApplicationController

  def index 
    @order = OrderShippingAddress.new
  end

  def create 
    @order_shipping_address = OrderShippingAddress.new(order_params)               
    if @order_shipping_address.valid?
       @order_shipping_address.save
        redirect_to root_path
    else
      render action: :index
    end
  end

  private                                                                                                       
  
  def  order_params
    params.permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :product_id).merge(user_id: current_user.id)
  end

end