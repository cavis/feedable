class TrumpetsController < ApplicationController
  # GET /trumpets
  # GET /trumpets.json
  def index
    @trumpets = Trumpet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trumpets }
    end
  end

  # GET /trumpets/1
  # GET /trumpets/1.json
  def show
    @trumpet = Trumpet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trumpet }
    end
  end

  # GET /trumpets/new
  # GET /trumpets/new.json
  def new
    @trumpet = Trumpet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trumpet }
    end
  end

  # GET /trumpets/1/edit
  def edit
    @trumpet = Trumpet.find(params[:id])
  end

  # POST /trumpets
  # POST /trumpets.json
  def create
    @trumpet = Trumpet.new(params[:trumpet])

    respond_to do |format|
      if @trumpet.save
        format.html { redirect_to @trumpet, notice: 'Trumpet was successfully created.' }
        format.json { render json: @trumpet, status: :created, location: @trumpet }
      else
        format.html { render action: "new" }
        format.json { render json: @trumpet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trumpets/1
  # PUT /trumpets/1.json
  def update
    @trumpet = Trumpet.find(params[:id])

    respond_to do |format|
      if @trumpet.update_attributes(params[:trumpet])
        format.html { redirect_to @trumpet, notice: 'Trumpet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trumpet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trumpets/1
  # DELETE /trumpets/1.json
  def destroy
    @trumpet = Trumpet.find(params[:id])
    @trumpet.destroy

    respond_to do |format|
      format.html { redirect_to trumpets_url }
      format.json { head :no_content }
    end
  end
end
