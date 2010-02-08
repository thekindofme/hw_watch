class Shop < ActiveRecord::Base
  has_many :shop_products
  has_many :products, :through => :shop_products
  has_many :brands, :through => :products
  has_many :categories, :through => :products
  
  validates_presence_of :name, :www_link, :shop_link
  validates_uniqueness_of :name
end
