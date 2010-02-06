class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category
  belongs_to :shop

  #TODO Products and Shops should have a many to many relationship

  validates_presence_of :model, :shop_id, :category_id, :url
end
