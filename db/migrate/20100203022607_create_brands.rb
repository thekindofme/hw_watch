class CreateBrands < ActiveRecord::Migration
  def self.up
    create_table :brands do |t|
      t.string :name
      t.string :image_url
      t.string :www_link
      t.string :description

      t.timestamps
    end
    add_index :brands, :name, :unique => true
  end

  def self.down
    drop_table :brands
  end
end
