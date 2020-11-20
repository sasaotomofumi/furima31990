class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index 
    @order = OrderShippingAddress.new
  end

  def create 
    @order = OrderShippingAddress.new(order_params)               
    if @order.valid?
       @order.save
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