require "price_grabber/price_grabber"
#require "price_grabber/parsers/parser"
#require "price_grabber/data_structures/category"
#require "price_grabber/data_structures/product"
#require "price_grabber/parsers/memory_lk_parser"

class AdminsController < ApplicationController
  before_filter :authenticate_admin!

  def index
  end

  def import
    @sites=LPriceGrabber::PriceGrabber.parsers
  end

  def doimport

  end

  protected
  def navigation_for_index
    if admin_signed_in?
      @context_sensitive_navigation=[]
      @context_sensitive_navigation << {:text => "Import", :link => url_for(:action => :import) }
    end
  end
end
