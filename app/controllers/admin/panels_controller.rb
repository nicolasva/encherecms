class Admin::PanelsController < ApplicationController
  respond_to :html

  def index
    @admin_panels = Panel.all

    respond_with @admin_panels
  end

  def sort
    params[:admin_panel].each_with_index do |id, index|
      Panel.position(index+1,id)
    end

    render :nothing => true
  end

  # GET /admin/panels/new
  # GET /admin/panels/new.json
  def new
    @admin_panel = Panel.new
    
    flash[:notice] = @admin_panel.save ? t("admin.panels.create.notice_success") : t("admin.panels.create.notice_failure") 
 
    respond_with(@admin_panel, :location => edit_panel_path(@admin_panel))
  end

  # GET /admin/panels/1/edit
  def edit
    @admin_panel = Panel.find(params[:id])
    @admin_content = @admin_panel.contents.first
    @admin_categoryall = @admin_panel.categoryalls.first
    respond_with(@admin_panel)
  end

  # PUT /admin/panels/1
  # PUT /admin/panels/1.json
  def update
    @admin_panel = Panel.find(params[:id])

    if @admin_panel.update_attributes(params[:admin_panel])
      params.keys.each do |k|
        set_params(k)
      end 
    else 
      flash[:notice] = t("admin.panels.update.notice_failure")
      respond_with(@admin_panel)
    end
  end

  # DELETE /admin/panels/1
  # DELETE /admin/panels/1.json
  def destroy
    @admin_panel = Panel.find(params[:id])
    @admin_panel.destroy ? t("panels.destroy.notice_success") : t("panels.destroy.notice_failure")

    respond_with(@admin_panel) 
  end
end
