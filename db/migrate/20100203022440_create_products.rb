class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :model
      t.decimal :price
      t.string :description
      t.string :url
      t.string :image_url
      t.string :sku
      t.boolean :in_stock
      t.int :items_in_stock
      t.string :warranty

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
