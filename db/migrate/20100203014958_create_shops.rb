class CreateShops < ActiveRecord::Migration
  def self.up
    create_table :shops do |t|
      t.string  :name
      t.string  :address
      t.string  :tel1
      t.string  :tel2
      t.integer :rating
      t.string  :www_link
      t.string  :shop_link
      t.timestamps
    end

    add_index :shops, :name, :unique => true
  end

  def self.down
    drop_table :shops
  end
end
