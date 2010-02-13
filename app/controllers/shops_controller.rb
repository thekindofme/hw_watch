class ShopsController < ApplicationController
  before_filter :authenticate_admin!, :only => ["edit", "new", "create", "update", "destroy"]

  def index
    if params[:brand_id]
      @shops=Brand.find(params[:brand_id]).shops
    elsif params[:category_id]
      @shops=Category.find(params[:category_id]).shops
    elsif params[:product_id]
      @shops=Product.find(params[:product_id]).shops
    else
      @shops=Shop.all
    end
    
    @shops_count=@shops.size
    @shops=@shops.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10
  end

  def show
    find_and_set_shop
  end

  def brands
    @brands=Shop.find(params[:id]).brands
  end

  def new
    @shop=Shop.new
  end

  def create
    @shop=Shop.new(params[:shop])
    if @shop.save
      flash[:notice] = "Successfully created the new Shop."
      redirect_to :action => "show", :id => @shop.id
    else
      flash[:notice] = "Something is wrong with your input, please recheck"
      render 'new'
    end
  end

  def edit
    find_and_set_shop
  end

  def update
    @shop=Shop.find(params[:id])
    if @shop.update_attributes(params[:shop])
      flash[:notice] = "Successfully updated Shop."
      redirect_to :action => "show", :id => params[:id]
    else
      flash[:notice] = "Something is wrong with your input, please recheck"
      render 'edit'
    end
  end

  def destroy
    Shop.find(params[:id]).destroy
    flash[:notice] = "Successfully removed Shop."
  end

    protected
  def navigation_for_index
    if admin_signed_in?
      @context_sensitive_navigation=[]
      @context_sensitive_navigation << {:text => "Add", :link => new_shop_path}
    end
  end

  private
  def find_and_set_shop
    if params[:product_id]
      @shop=Product.find(params[:product_id]).shop
    else
      @shop=Shop.find(params[:id])
    end
  end

end
