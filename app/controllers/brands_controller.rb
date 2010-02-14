class BrandsController < ApplicationController
  before_filter :authenticate_admin!, :only => ["edit", "new", "create", "update", "destroy"]

  def new
    @brand=Brand.new
  end

  def create
    @brand=Brand.new(params[:brand])
    if @brand.save
      flash[:notice] = "Successfully created the new Brand."
      redirect_to :action => "show", :id => @brand.id
    else
      flash[:notice] = "Something is wrong with your input, please recheck"
      render 'new'
    end
  end

  def edit
    find_and_set_brand
  end

  def update
    @brand=Brand.find(params[:id])
    if @brand.update_attributes(params[:brand])
      flash[:notice] = "Successfully updated brand."
      redirect_to :action => "show", :id => params[:id]
    else
      flash[:notice] = "Something is wrong with your input, please recheck"
      render 'edit'
    end
  end

  def destroy
    Brand.find(params[:id]).destroy
    flash[:notice] = "Successfully removed Brand."
    redirect_to :action => "index"
  end

  def show
    find_and_set_brand
  end

  def index
    if params[:shop_id]
      @brands=Shop.find(params[:shop_id]).brands
    elsif params[:category_id]
      @brands=Category.find(params[:category_id]).brands
    else
      @brands=Brand.all
    end

    @brands_count=@brands.size
    @brands=@brands.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10
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
