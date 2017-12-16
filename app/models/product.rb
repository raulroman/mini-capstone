class Product < ApplicationRecord
  belongs_to :supplier 

  validates :name, uniqueness: true 
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { minimum: 10 }

  def as_json  
    {
     name: name,
     price: price,
     image: image,
     description: description,
     is_discounted?: is_discounted?,
     # tax: tax,
     # total: total,
     Supplier: supplier_id
     } 
  end

  def is_discounted?
    price.to_f < 20

  end
  
  # def tax
  #   price.to_f *= 0.09      
  # end 

  # def total
  #   price.to_f + tax
      
  # end
end