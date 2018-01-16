class OrdersController < ApplicationController

  def create
    calculated_tax = calculated_subtotal * 0.09
    


    order = Order.new(
    user_id: params[:user_id],
    product_id: params[:prodcut_id],
    quantity: params[:quantity],
    subtotal: calculated_subtotal,
    tax: calculated_tax,
    total: calculated_total
    )
    if order.save
      render json: order.as_json
    else
      render json:{ errors: order.errors.full_messages}
    end
  end
end
