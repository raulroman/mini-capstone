class ProductsController < ApplicationController
  def index
    #get all products from my db
    products = Product.where("name LIKE ?", "%#{search}%").order(:id) 
    # show user all prodcuts
    render json: products.as_json
  end



  def show
    #go to params hash and and get the id
    the_id = params['id']
    #grab a particular product from the db
    product = Product.find_by(id: the_id) 
    #show a particular product
    render json:  product.as_json
    
  end

  def create
    product = Product.new(
      name: params['name'],
      price: params['price'],
      image: params['image'],
      description: params['description']
      )
    if product.save 
      render json: product.as_json
    else 
      render json: { message: product.errors.full_messages }
    end 
  end

  def update
    #grab a product from the database
    #actually update it
    the_id = params['id'] 
    product = Product.find_by(id: the_id)

    if product.update(
    params[:name],
    params[:price],
    params[:image],
    params[:description]
    )
      render json: product.as_json
    else 
      render json: {message: product.errors.full_messages }
    end
  end

  def destroy
    #find a particular product in db like update and show 
    the_id = params['id']
    product = Product.find_by(id: the_id)
    product.destroy
  end

end

