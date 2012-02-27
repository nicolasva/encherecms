class Admin::CategoryallsController < ApplicationController
  respond_to :html
  # GET /admin/categoryalls
  # GET /admin/categoryalls.json
  def index
    @admin_categoryalls = Categoryall.all

    respond_with @admin_categoryalls
  end

  # GET /admin/categoryalls/1
  # GET /admin/categoryalls/1.json
  def show
    @admin_categoryall = Admin::Categoryall.find(params[:id])

    respond_with @admin_categoryall
  end

  # GET /admin/categoryalls/new
  # GET /admin/categoryalls/new.json
  def new
    @admin_categoryall = Admin::Categoryall.new

    respond_with @admin_categoryall
  end

  # GET /admin/categoryalls/1/edit
  def edit
    @admin_categoryall = Categoryall.find(params[:id])
    @admin_panel = @admin_categoryall.panel 
    @admin_content = @admin_panel.contents.first
    respond_with(@admin_categoryall)
  end

  # PUT /admin/categoryalls/1
  # PUT /admin/categoryalls/1.json
  def update
    @admin_categoryall = Categoryall.find(params[:id])

    if @admin_categoryall.update_attributes(params[:admin_categoryall])
      params.keys.each do |k|
        set_params(k)
      end
      
    else
      flash[:notice] = t("admin.categoryalls.update.notice_failure") 
      respond_with(@admin_categoryall)
    end
  end

  # DELETE /admin/categoryalls/1
  # DELETE /admin/categoryalls/1.json
  def destroy
    @admin_categoryall = Categoryall.find(params[:id])
    @admin_categoryall.destroy
    respond_with(@admin_categoryall, :location => admin_panels_url)
  end
end
