class ProductsController < ApplicationController
  def index
    #get all products from my db
    products = Product.all
    # show user all prodcuts
    render json: products.as_json
  end



  def show
    #go to params hash and and get the id
    the_id = params['id']
    #grab a particular product from the db
    products = Product.find_by(id: the_id) 
    #show a particular product
    render json:  products.as_json
    
  end

  def create
    products = Product.new(
      name: params['name'],
      price: params['price'],
      image: params['image'],
      description: params['description']
      )
    products.save

    render json: products.as_json 
  end

  def update
    #grab a product from the database
    #actually update it
    the_id = params['id']
    products = Product.find_by(id: the_id)
    products.name = params['name']
    products.price = params['price']
    products.image = params['image']
    products.description = params['description']
    products.save 
    render json: products.as_json
    
  end
  def destroy
    #find a particular product in db like update and show 
    the_id = params['id']
    products = Product.find_by(id: the_id)
    products.destroy
  end

end

