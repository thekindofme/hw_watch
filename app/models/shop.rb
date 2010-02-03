class Shop < ActiveRecord::Base
  has_many :products
  has_many :brands, :through => :products
  has_many :categories, :through => :products
end
