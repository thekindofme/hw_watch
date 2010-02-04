class Category < ActiveRecord::Base
  has_many :products
  has_many :brands, :through => :products
  has_many :shops, :through => :products

  validates_presence_of :name
end
