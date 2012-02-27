class Admin::ContentsController < ApplicationController
  respond_to :html

  def index
    @admin_contents = Admin::Content.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_contents }
    end
  end

  # GET /admin/contents/1
  # GET /admin/contents/1.json
  def show
    @admin_content = Admin::Content.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_content }
    end
  end

  # GET /admin/contents/new
  # GET /admin/contents/new.json
  def new
    @admin_content = Admin::Content.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_content }
    end
  end

  # GET /admin/contents/1/edit
  def edit
    @admin_content = Content.find(params[:id])
    @admin_panel = Panel.find(@admin_content.contains_id)
    @admin_categoryall = @admin_panel.categoryalls.first
    respond_with(@admin_content)
  end

  # POST /admin/contents
  # POST /admin/contents.json
  def create
    @admin_content = Admin::Content.new(params[:admin_content])

    respond_to do |format|
      if @admin_content.save
        format.html { redirect_to @admin_content, notice: 'Content was successfully created.' }
        format.json { render json: @admin_content, status: :created, location: @admin_content }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_content.errors, status: :unprocessable_entity }
      end
    end
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

    respond_to do |format|
      format.html { redirect_to admin_contents_url }
      format.json { head :no_content }
    end
  end
end
