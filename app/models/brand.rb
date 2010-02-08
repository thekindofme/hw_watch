class Brand < ActiveRecord::Base
  has_many :products
  has_many :categories, :through => :products
  has_many :shops, :through => :products, :uniq => true

  validates_presence_of :name
  validates_uniqueness_of :name
end
