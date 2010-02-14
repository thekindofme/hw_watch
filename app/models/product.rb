class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category
  has_many :shop_products
  has_many :shops, :through => :shop_products

  validates_presence_of :model, :category_id, :url
  validates_uniqueness_of :model
end
