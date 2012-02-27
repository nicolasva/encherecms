class Admin::PanelsController < ApplicationController
  respond_to :html

  def index
    @admin_panels = Panel.all

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @admin_panels }
    #end
    respond_with @admin_panels
  end

  # GET /admin/panels/1
  # GET /admin/panels/1.json
  def show
    @admin_panel = Panel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_panel }
    end
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

  # POST /admin/panels
  # POST /admin/panels.json
  #def create
  #  @admin_panel = Admin::Panel.new(params[:admin_panel])

  #  respond_to do |format|
  #    if @admin_panel.save
  #      format.html { redirect_to @admin_panel, notice: 'Panel was successfully created.' }
  #      format.json { render json: @admin_panel, status: :created, location: @admin_panel }
  #    else
  #      format.html { render action: "new" }
  #"      format.json { render json: @admin_panel.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

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
    @admin_panel.destroy

    respond_to do |format|
      format.html { redirect_to admin_panels_url }
      format.json { head :no_content }
    end
  end
end
