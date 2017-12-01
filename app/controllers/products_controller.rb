class ProductsController < ApplicationController
  def the_product
    the_product1 = Product.first
    the_product2 = Product.second
  

    render json: {
    product_name: the_product1.name,
    product_price: the_product1.price,
    product_image: the_product1.image,
    product_description: the_product1.description,
    second_product: the_product2.name
  }
  end
end
