class CreateShopProducts < ActiveRecord::Migration
  def self.up
    create_table :shop_products do |t|
      t.integer :shop_id
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :shop_products
  end
end
