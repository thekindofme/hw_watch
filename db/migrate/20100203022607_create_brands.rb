class CreateBrands < ActiveRecord::Migration
  def self.up
    create_table :brands do |t|
      t.string :name
      t.string :image_url
      t.string :www_link
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :brands
  end
end
