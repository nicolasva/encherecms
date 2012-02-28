class Admin::ContentsController < ApplicationController
  respond_to :html

  # GET /admin/contents/1/edit
  def edit
    @admin_content = Content.find(params[:id])
    @admin_panel = Panel.find(@admin_content.contains_id)
    @admin_categoryall = @admin_panel.categoryalls.first
    @admin_product = @admin_categoryall.products.first
    respond_with(@admin_content)
  end

  # PUT /admin/contents/1
  # PUT /admin/contents/1.json
  def update
    @admin_content = Content.find(params[:id])

      if @admin_content.update_attributes(params[:admin_content])
        params.keys.each do |k|
          set_params(k)
        end
      else
        flash[:notice] = t("admin.contents.update.notice_failure")
        respond_with(@admin_content)
      end
  end

  # DELETE /admin/contents/1
  # DELETE /admin/contents/1.json
  def destroy
    @admin_content = Admin::Content.find(params[:id])
    @admin_content.destroy

    respond_with(@admin_content)
  end
end
