require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "able to create a product with valid data" do
    product=Product.new(:brand_id => 1, :category_id => 0, :description => "sample description", :image_url => "http://www.roughe.so.spelling.mistakes.com", :in_stock => true, :items_in_stock => 21,
                        :model => "JDF2412 Baracla+ GFdsqera", :price => 212.85, :shop_id => 2, :sku => "1212fDFDFO124w1fwf", :url => "http://milastkea.com/item.php?323d=fdgf",
                        :warranty => "full warranty for your whole life time.")
    assert product.save
  end

  test "can't create a product without a model" do
    product=Product.new(:brand_id => 1, :category_id => 0, :description => "sample description", :image_url => "http://www.roughe.so.spelling.mistakes.com", :in_stock => true, :items_in_stock => 21,
                        :price => 212.85, :shop_id => 2, :sku => "1212fDFDFO124w1fwf", :url => "http://milastkea.com/item.php?323d=fdgf",
                        :warranty => "full warranty for your whole life time.")
    assert !product.save
  end

  test "can't create a product without a shop" do
    product=Product.new(:brand_id => 1, :category_id => 0, :description => "sample description", :image_url => "http://www.roughe.so.spelling.mistakes.com", :in_stock => true, :items_in_stock => 21,
                        :model => "JDF2412 Baracla+ GFdsqera", :price => 212.85, :sku => "1212fDFDFO124w1fwf", :url => "http://milastkea.com/item.php?323d=fdgf",
                        :warranty => "full warranty for your whole life time.")
    assert !product.save
  end

  test "can't create a product without a category" do
    product=Product.new(:brand_id => 1, :description => "sample description", :image_url => "http://www.roughe.so.spelling.mistakes.com", :in_stock => true, :items_in_stock => 21,
                        :model => "JDF2412 Baracla+ GFdsqera", :price => 212.85, :shop_id => 2, :sku => "1212fDFDFO124w1fwf", :url => "http://milastkea.com/item.php?323d=fdgf",
                        :warranty => "full warranty for your whole life time.")
    assert !product.save
  end

  test "can't create a product without a url" do
    product=Product.new(:brand_id => 1, :category_id => 0, :description => "sample description", :image_url => "http://www.roughe.so.spelling.mistakes.com", :in_stock => true, :items_in_stock => 21,
                        :model => "JDF2412 Baracla+ GFdsqera", :price => 212.85, :shop_id => 2, :sku => "1212fDFDFO124w1fwf",
                        :warranty => "full warranty for your whole life time.")
    assert !product.save
  end

  test "can't create a product with a model name of a already existing product's model name" do
    product=Product.new(:brand_id => 0, :category_id => 0, :description => "sample description", :image_url => "http://www.roughe.so.speg.istakes.com", :in_stock => true, :items_in_stock => 21,
                        :model => "JDF2412 Baracla+ GFdsqera", :price => 2121.55, :shop_id => 0, :sku => "1212f3423lFO124w1fwf", :url => "http://milastkea.com/item.php?323d=fdgf",
                        :warranty => "nothing.")
    product.save

    product=Product.new(:brand_id => 1, :category_id => 0, :description => "sample description", :image_url => "http://www.roughe.so.spelling.mistakes.com", :in_stock => true, :items_in_stock => 21,
                        :model => "JDF2412 Baracla+ GFdsqera", :price => 212.85, :shop_id => 2, :sku => "1212fDFDFO124w1fwf", :url => "http://milastkea.com/item.php?323d=fdgf",
                        :warranty => "full warranty for your whole life time.")
    assert !product.save
  end

end
