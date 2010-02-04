class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop=Shop.find(params[:id])
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
    @shop=Shop.find(params[:id])
  end

  def update
    @shop=Shop.find(params[:id])
    if @shop.update_attributes(params[:shop])
      flash[:notice] = "Successfully updated Shop."
      redirect_to :action => "index"
    else
      flash[:notice] = "Something is wrong with your input, please recheck"
      render 'edit'
    end
  end

  def destroy
    Shop.find(params[:id]).destroy
    flash[:notice] = "Successfully removed Shop."
  end

end
