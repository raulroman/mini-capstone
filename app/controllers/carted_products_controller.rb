class CartedProductsController < ApplicationController

  # def index
    
  # end
  def create
    carted_product = CartedProduct.new(
      user_id: params[:user_id], 
      quantity: params[:quantity],
      product_id: params[:product_id],
      user_id: params[:id],
      status: "carted"
    )

    if carted_product.save
      render json: carted_product.as_json
    else 
      render json: {errors: carted_product.errors.full_messages}
    end
  end
end
