class ProductsController < ApplicationController
  before_filter :authenticate_admin!, :only => ["edit", "new", "create", "update", "destroy"]

  def index
    if params[:shop_id]
      @products=Shop.find(params[:shop_id]).products
    elsif params[:brand_id]
      @products=Brand.find(params[:brand_id]).products
    elsif params[:category_id]
      @products=Category.find(params[:category_id]).products
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
    @product=Product.new
  end

  def create
  end

  def update
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:notice] = "Successfully removed Product."
  end

end
