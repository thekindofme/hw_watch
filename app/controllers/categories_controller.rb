class CategoriesController < ApplicationController
  before_filter :authenticate_admin!, :only => ["edit", "new", "create", "update", "destroy"]

  def new
    @category=Category.new
  end

  def create
    @category=Category.new(params[:category])
    if @category.save
      flash[:notice] = "Successfully created the new Category."
      redirect_to :action => "show", :id => @category.id
    else
      flash[:notice] = "Something is wrong with your input, please recheck"
      render 'new'
    end
  end

  def show
    find_and_set_shop
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:notice] = "Successfully removed Category."
    redirect_to :action => "index"
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
    @category=Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "Successfully updated category."
      redirect_to :action => "show", :id => params[:id]
    else
      flash[:notice] = "Something is wrong with your input, please recheck"
      render 'edit'
    end
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
