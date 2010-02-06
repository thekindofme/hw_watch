class CategoriesController < ApplicationController
  before_filter :authenticate_admin!, :only => ["edit", "new", "create", "update", "destroy"]

  def new
    @category=Category.new
  end

  def create
  end

  def show
    find_and_set_shop
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:notice] = "Successfully removed Category."
  end

  def index
    if params[:brand_id]
      @categories=Brand.find(params[:brand_id]).categories
    elsif params[:shop_id]
      @categories=Shop.find(params[:shop_id]).categories
    else
      @categories=Category.all
    end
  end

  def edit
    find_and_set_shop
  end

  def update
  end

  private
  def find_and_set_shop
    if params[:product_id]
      @category=Product.find(params[:product_id]).category
    else
      @category=Category.find(params[:id])
    end
  end

end
