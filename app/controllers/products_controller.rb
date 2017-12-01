class ProductsController < ApplicationController
  def the_product
    the_products = Product.all
  

    render the_products.as_json
  end
end
