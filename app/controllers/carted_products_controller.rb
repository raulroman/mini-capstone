class CartedProductsController < ApplicationController

  def index

    carted_products = CartedProduct.where(user_id: current_user.id).where(status: "carted")
    p carted_products
    render json: carted_products.as_json
 
  end

  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id, 
      quantity: params[:quantity],
      product_id: params[:product_id],
      status: "carted"
    )

    if carted_product.save
      render json: carted_product.as_json
    else 
      render json: {errors: carted_product.errors.full_messages}
    end
  end
end
