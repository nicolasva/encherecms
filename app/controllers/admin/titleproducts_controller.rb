class Admin::TitleproductsController < ApplicationController
  respond_to :html

  def index
    @admin_titleproducts = Titleproduct.all
    
    respond_with @admin_titleproducts
  end

  def edit
    @admin_titleproduct = Titleproduct.find(params[:id])
    @admin_product = @admin_titleproduct.product
    @admin_categoryall = @admin_product.categoryall
    @admin_panel = @admin_categoryall.panel
    @admin_content = @admin_panel.contents.first 
    
    respond_with(@admin_titleproduct)
  end
end
