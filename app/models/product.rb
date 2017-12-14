class Product < ApplicationRecord

  validates :name, uniqueness: true 
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { minimum: 10 }

  # def json  {
  #    name: name,
  #    price: price,
  #    image: image,
  #    description: description,
  #    is_discounted?: is_discounted?,
  #    tax: tax,
  #    total: total
      
  #    } 
  # end

  # def is_discounted?
  #   price.to_f < 20

  # end
  
  # def tax
  #   price *= 0.09      

  # end 

  # def total
  #   price + tax
      
  # end



end





# • Create a model method called `is_discounted` that returns true if an item is under $2 and false otherwise.
# • Create a model method called tax which will return the tax that would be charged for a particular product. (Assume a 9% tax rate.)
# • Create a model method called total which will return the sum of the price + tax.
# • Overwrite the as_json method to return the model methods as part of the JSON output.


