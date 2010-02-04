class ProductsController < ApplicationController
  def index
    if params[:shop_id]
      @products=Shop.find(params[:shop_id]).products
    else
      @products=Product.all
    end
  end

  def show
    @product=Product.find(params[:id])
  end

  def edit
    @product=Product.find(params[:id])
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
    Product.find(params[:id]).destroy
  end

end
