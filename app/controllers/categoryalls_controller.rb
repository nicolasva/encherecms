class CategoryallsController < ApplicationController
  # GET /categoryalls
  # GET /categoryalls.json
  def index
    @categoryalls = Categoryall.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categoryalls }
    end
  end

  # GET /categoryalls/1
  # GET /categoryalls/1.json
  def show
    @categoryall = Categoryall.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @categoryall }
    end
  end

  # GET /categoryalls/new
  # GET /categoryalls/new.json
  def new
    @categoryall = Categoryall.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @categoryall }
    end
  end

  # GET /categoryalls/1/edit
  def edit
    @categoryall = Categoryall.find(params[:id])
  end

  # POST /categoryalls
  # POST /categoryalls.json
  def create
    @categoryall = Categoryall.new(params[:categoryall])

    respond_to do |format|
      if @categoryall.save
        format.html { redirect_to @categoryall, notice: 'Categoryall was successfully created.' }
        format.json { render json: @categoryall, status: :created, location: @categoryall }
      else
        format.html { render action: "new" }
        format.json { render json: @categoryall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categoryalls/1
  # PUT /categoryalls/1.json
  def update
    @categoryall = Categoryall.find(params[:id])

    respond_to do |format|
      if @categoryall.update_attributes(params[:categoryall])
        format.html { redirect_to @categoryall, notice: 'Categoryall was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @categoryall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoryalls/1
  # DELETE /categoryalls/1.json
  def destroy
    @categoryall = Categoryall.find(params[:id])
    @categoryall.destroy

    respond_to do |format|
      format.html { redirect_to categoryalls_url }
      format.json { head :no_content }
    end
  end
end
