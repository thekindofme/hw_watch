require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "able to create a category with valid data" do
    category=Category.new
    category.name="category name"
    category.description="the description for this category"
    assert category.save
  end

  test "can't create a category with a name of a already existing category's name" do
    category=Category.new
    category.name="category name"
    category.description="the description for this category"
    category.save

    category=Category.new
    category.name="category name"
    category.description="the description for this category is different from the first one"
    assert !category.save
  end

end
