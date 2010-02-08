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

    @categories_count=@categories.size
    @categories=@categories.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10
  end

  def edit
    find_and_set_shop
  end

  def update
  end

  protected
  def navigation_for_index
    if admin_signed_in?
      @context_sensitive_navigation=[]
      @context_sensitive_navigation << {:text => "Add", :link => new_category_path}
    end
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
