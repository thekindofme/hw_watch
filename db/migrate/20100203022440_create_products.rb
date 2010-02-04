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

      t.integer :brand_id
      t.integer :shop_id
      t.integer :category_id

      t.timestamps
    end

    add_index :products, :model
  end

  def self.down
    drop_table :products
  end
end
