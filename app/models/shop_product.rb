class ShopProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :shop

  validates_presence_of :product
  validates_presence_of :shop

  #TODO: verify whether the line bellow works as intended
  validates_uniqueness_of :product_id, :scope => :shop_id
end
