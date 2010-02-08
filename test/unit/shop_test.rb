require 'test_helper'

class ShopTest < ActiveSupport::TestCase

  test "able to create a shop with valid data" do
    shop=Shop.new(:address=>"some address here.", :name=>"shop123", :rating=>51, :shop_link=>"http://some_link.com/here", :tel1=>"2412-124-512-1241", :tel2=>"2322-111-512-1241",
                  :www_link=>"http://www.yonowkmeka.com/heyya/soprano.do?fs=df12r")
    assert shop.save
  end

  test "can't create a shop without a name" do
    shop=Shop.new(:address=>"some address here.", :rating=>51, :shop_link=>"http://some_link.com/here", :tel1=>"2412-124-512-1241", :tel2=>"2322-111-512-1241",
                  :www_link=>"http://www.yonowkmeka.com/heyya/soprano.do?fs=df12r")
    assert !shop.save
  end

  test "can't create a shop without a www_link" do
    shop=Shop.new(:address=>"some address here.", :rating=>51, :shop_link=>"http://some_link.com/here", :tel1=>"2412-124-512-1241", :tel2=>"2322-111-512-1241")
    assert !shop.save
  end

  test "can't create a shop without a shop_link" do
    shop=Shop.new(:address=>"some address here.", :rating=>51, :tel1=>"2412-124-512-1241", :tel2=>"2322-111-512-1241",
                  :www_link=>"http://www.yonowkmeka.com/heyya/soprano.do?fs=df12r")
    assert !shop.save
  end

  test "can't create a shop with a name of a already existing shop's name" do
    shop=Shop.new(:address=>"some address here.", :name=>"shop123", :rating=>51, :shop_link=>"http://some_link.com/here", :tel1=>"2412-124-512-1241", :tel2=>"2322-111-512-1241",
                  :www_link=>"http://www.yonowkmeka.com/heyya/soprano.do?fs=df12r")
    shop.save

    shop=Shop.new(:address=>"some address here21.", :name=>"shop123", :rating=>11, :shop_link=>"http://somdsdlink.com/here", :tel1=>"2412-124-512-1241", :tel2=>"2322-111-512-1241",
                  :www_link=>"http://www.yonowkmeka.com/heyya/soprano.do?fs=df12r")
    assert !shop.save
  end

end
