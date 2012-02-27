class ContentsController < ApplicationController
  # GET /contenus
  # GET /contenus.json
  def index
    @contenus = Contenu.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contenus }
    end
  end

  # GET /contenus/1
  # GET /contenus/1.json
  def show
    @contenu = Contenu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contenu }
    end
  end

  # GET /contenus/new
  # GET /contenus/new.json
  def new
    @contenu = Contenu.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contenu }
    end
  end

  # GET /contenus/1/edit
  def edit
    @contenu = Contenu.find(params[:id])
  end

  # POST /contenus
  # POST /contenus.json
  def create
    @contenu = Contenu.new(params[:contenu])

    respond_to do |format|
      if @contenu.save
        format.html { redirect_to @contenu, notice: 'Contenu was successfully created.' }
        format.json { render json: @contenu, status: :created, location: @contenu }
      else
        format.html { render action: "new" }
        format.json { render json: @contenu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contenus/1
  # PUT /contenus/1.json
  def update
    @contenu = Contenu.find(params[:id])

    respond_to do |format|
      if @contenu.update_attributes(params[:contenu])
        format.html { redirect_to @contenu, notice: 'Contenu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contenu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contenus/1
  # DELETE /contenus/1.json
  def destroy
    @contenu = Contenu.find(params[:id])
    @contenu.destroy

    respond_to do |format|
      format.html { redirect_to contenus_url }
      format.json { head :no_content }
    end
  end
end
