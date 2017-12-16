require 'unirest'
require 'pp'


p "Check out my products"
p "Choose a Product"
p "[1] See all products"
p "[1.1] Which product id would you like to see?"
p "[2] sell one particular product"
p "[3] Make a new Product"
p "[4] Update a product"
p "[5] Destroy a product"
user_input = gets.chomp
if user_input == '1'
  #show all products
  response = Unirest.get("localhost:3000/products", parameters: {search_term: search})
  p response.body
elsif user_input == "1.1"
  p "Enter a product id"
  search_input = gets.chomp
  response = Unirest.get("localhost:3000/products", parameters: {search_term: search_input })
  product = response.body
  pp product
elsif user_input == '2'
  #get particular product
  #get user input for the product id
  p "Enter an id for a specific product"
  product_id = gets.chomp
#make a unirest call to get back that item
  response = Unirest.get("localhost:3000/products/#{product_id}")
  p response.body
elsif user_input == '3'
  the_params = {}
  p "Let's make a product!"
  # Make a new product in the db
  p "Tell me the product name?"
  the_params['name'] = gets.chomp
  p "Tell me the product price?"
  the_params['price'] = gets.chomp
  p "Tell me the product image" 
  the_params['image'] = gets.chomp
  p "Tell me the product description"
  the_params['description'] = gets.chomp
  response = Unirest.post("localhost:3000/products?", parameters: the_params)
  p response.body

elsif user_input == '4'
  the_params = {}
  p "Which product would you like to update?"
  product_id = gets.chomp
  #make a unirest call to get back that item
  response = Unirest.get("localhost:3000/products/#{product_id}")
  p response.body
  # update a product in the db 
  p "Tell me the product name?"
  the_params[:name] = gets.chomp
  p "Tell me the product price?"
  the_params[:price] = gets.chomp
  p "Tell me the product image"
  the_params[:image] = gets.chomp
  p "Tell me the product description"  
  the_params[:description] = gets.chomp

  #Take that user input and update product
  response = Unirest.patch("localhost:3000/products/#{product_id}", 
    parameters: the_params)
 
  p response.body
  
elsif user_input == '5'
  p "Which product do you want to destroy?"
  product_id = gets.chomp
  response = Unirest.delete("localhost:3000/products/#{product_id}")
end



