class TitleproductsController < ApplicationController
  # GET /titleproducts
  # GET /titleproducts.json
  def index
    @titleproducts = Titleproduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @titleproducts }
    end
  end

  # GET /titleproducts/1
  # GET /titleproducts/1.json
  def show
    @titleproduct = Titleproduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @titleproduct }
    end
  end

  # GET /titleproducts/new
  # GET /titleproducts/new.json
  def new
    @titleproduct = Titleproduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @titleproduct }
    end
  end

  # GET /titleproducts/1/edit
  def edit
    @titleproduct = Titleproduct.find(params[:id])
  end

  # POST /titleproducts
  # POST /titleproducts.json
  def create
    @titleproduct = Titleproduct.new(params[:titleproduct])

    respond_to do |format|
      if @titleproduct.save
        format.html { redirect_to @titleproduct, notice: 'Titleproduct was successfully created.' }
        format.json { render json: @titleproduct, status: :created, location: @titleproduct }
      else
        format.html { render action: "new" }
        format.json { render json: @titleproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /titleproducts/1
  # PUT /titleproducts/1.json
  def update
    @titleproduct = Titleproduct.find(params[:id])

    respond_to do |format|
      if @titleproduct.update_attributes(params[:titleproduct])
        format.html { redirect_to @titleproduct, notice: 'Titleproduct was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @titleproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /titleproducts/1
  # DELETE /titleproducts/1.json
  def destroy
    @titleproduct = Titleproduct.find(params[:id])
    @titleproduct.destroy

    respond_to do |format|
      format.html { redirect_to titleproducts_url }
      format.json { head :no_content }
    end
  end
end
