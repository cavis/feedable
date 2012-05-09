class RoostersController < ApplicationController
  # GET /roosters
  # GET /roosters.json
  def index
    @roosters = Rooster.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @roosters }
    end
  end

  # GET /roosters/1
  # GET /roosters/1.json
  def show
    @rooster = Rooster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rooster }
    end
  end

  # GET /roosters/new
  # GET /roosters/new.json
  def new
    @rooster = Rooster.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rooster }
    end
  end

  # GET /roosters/1/edit
  def edit
    @rooster = Rooster.find(params[:id])
  end

  # POST /roosters
  # POST /roosters.json
  def create
    @rooster = Rooster.new(params[:rooster])

    respond_to do |format|
      if @rooster.save
        format.html { redirect_to @rooster, notice: 'Rooster was successfully created.' }
        format.json { render json: @rooster, status: :created, location: @rooster }
      else
        format.html { render action: "new" }
        format.json { render json: @rooster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /roosters/1
  # PUT /roosters/1.json
  def update
    @rooster = Rooster.find(params[:id])

    respond_to do |format|
      if @rooster.update_attributes(params[:rooster])
        format.html { redirect_to @rooster, notice: 'Rooster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rooster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roosters/1
  # DELETE /roosters/1.json
  def destroy
    @rooster = Rooster.find(params[:id])
    @rooster.destroy

    respond_to do |format|
      format.html { redirect_to roosters_url }
      format.json { head :no_content }
    end
  end
end
