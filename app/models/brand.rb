class Brand < ActiveRecord::Base
  has_many :products
  has_many :categories, :through => :products
  has_many :shops, :through => :products
end
