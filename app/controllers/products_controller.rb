class ProductsController < ApplicationController
  def index
    #get all products from my db
    search = params[:search_term]
    products = Product.where("description LIKE ?", "%#{search}%").order(:id) 
    # show user all prodcuts
    render json: products.as_json
  end



  def show
    #go to params hash and and get the id
    #grab a particular product from the db
    product = Product.find_by(id: params[:id]) 
    #show a particular product
    render json:  product.as_json
    
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description]
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
    product = Product.find_by(id: params[:id])

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
    product = Product.find_by(id: params[:id])
    product.destroy
  end

end

