require 'unirest'

# Make a Ruby frontend script using the Unirest gem to display the results in the terminal instead of a web browser!

response = Unirest.get("http://localhost:3000/product_url")

#Show user that data
product = response.body

p "This product name is #{product.first[1]}"
# p product.first[1]