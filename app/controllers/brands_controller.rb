class BrandsController < ApplicationController
  def new
  end

  def create
  end

  def edit
    find_and_set_brand
  end

  def update
  end

  def destroy
  end

  def show
    find_and_set_brand
  end

  def index
  end

private
  def find_and_set_brand
    if params[:product_id]
      @brand=Product.find(params[:product_id]).brand
    else
      @brand=Brand.find(params[:id])
    end
  end

end
