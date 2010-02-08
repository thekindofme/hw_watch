require 'test_helper'

class BrandTest < ActiveSupport::TestCase

  test "able to create a brand with valid data" do
    brand=Brand.new
    brand.description="some description about the brand. can include any text here, including 2212 412 !@!@ 25112@$."
    brand.image_url="http://www.esdf.com/sdfrsf.jpg"
    brand.name="the brand name"
    brand.www_link="http://www.esdf.com/sdfrsf.jpg"
    assert brand.save
  end

  test "can't create a brand without a name" do
    brand=Brand.new
    brand.description="some description about the brand. can include any text here, including 2212 412 !@!@ 25112@$."
    brand.image_url="http://www.esdf.com/sdfrsf.jpg"
    brand.www_link="http://www.esdf.com/sdfrsf.jpg"
    assert !brand.save
  end

  test "can't create a brand with a name of a already existing brand's name" do
    brand=Brand.new
    brand.name="brandxzy"
    brand.description="some description about the brand. can include any text here, including 2212 412 !@!@ 25112@$."
    brand.image_url="http://www.esdf.com/sdfrsf.jpg"
    brand.www_link="http://www.esdf.com/sdfrsf.jpg"
    brand.save

    brand=Brand.new
    brand.name="brandxzy"
    brand.description="some description about the brand. can include any text here, including 2212 412 !@!@ 25112@$."
    brand.image_url="http://www.esdf.com/sdfrsf.jpg"
    brand.www_link="http://www.esdf.com/sdfrsf.jpg"
    assert !brand.save
  end

end
