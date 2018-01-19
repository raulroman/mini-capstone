class Product < ApplicationRecord
  # belongs_to :supplier 
  # has_many :carted_products
  # has_many :orders, through: :carted_products



  validates :name, uniqueness: true 
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { minimum: 10 }

  def as_json  
    {
     name: name,
     id: id,
     price: price,
     image: image,
     description: description,
     is_discounted?: is_discounted?,
     tax: tax,
     total: total,
     Supplier: supplier_id,
     updated_at: friendly_updated_at
    } 
  end

  def friendly_updated_at
    updated_at.strftime("%A, %b %d")
  end

  def is_discounted?
    price.to_f < 20
  end
  
  def tax
    price.to_i * 0.09      
  end 

  def total
    price.to_i + tax
  end
end