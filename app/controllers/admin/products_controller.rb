class Admin::ProductsController < ApplicationController
  respond_to :html
  # GET /admin/products/1/edit
  def edit
    @admin_product = Product.find(params[:id])
    @admin_categoryall = @admin_product.categoryall
    @admin_panel = @admin_categoryall.panel
    @admin_content = @admin_panel.contents.first
    respond_with(@admin_product)
  end

  # PUT /admin/products/1
  # PUT /admin/products/1.json
  def update
    @admin_product = Product.find(params[:id])

    if @admin_product.update_attributes(params[:admin_product])
      flash[:notice] = t('admin.products.update.notice_success')
      params.keys.each do |k|
        set_params(k)
      end
    else
      flash[:notice] = t('admin.products.update.notice_failure') 
    end
    respond_with(@admin_product)
  end

  # DELETE /admin/products/1
  # DELETE /admin/products/1.json
  def destroy
    @admin_product = Product.find(params[:id])
    flash[:notice] = @admin_product.destroy ? t('admin.products.destroy.notice_success') : t('admin.products.destroy.notice_failure')

    respond_with(@admin_product)
  end
end
