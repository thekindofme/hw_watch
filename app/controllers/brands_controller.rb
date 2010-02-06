class BrandsController < ApplicationController
  before_filter :authenticate_admin!, :only => ["edit", "new", "create", "update", "destroy"]

  def new
    @brand=Brand.new
  end

  def create
  end

  def edit
    find_and_set_brand
  end

  def update
  end

  def destroy
    Brand.find(params[:id]).destroy
    flash[:notice] = "Successfully removed Brand."
  end

  def show
    find_and_set_brand
  end

  def index
    @brands=Brand.all
  end

  protected
  def navigation_for_index
    if admin_signed_in?
      @context_sensitive_navigation=[]
      @context_sensitive_navigation << {:text => "Add", :link => new_brand_path}
    end
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
