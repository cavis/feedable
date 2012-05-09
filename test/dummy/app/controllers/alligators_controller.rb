class AlligatorsController < ApplicationController
  # GET /alligators
  # GET /alligators.json
  def index
    @alligators = Alligator.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @alligators }
    end
  end

  # GET /alligators/1
  # GET /alligators/1.json
  def show
    @alligator = Alligator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @alligator }
    end
  end

  # GET /alligators/new
  # GET /alligators/new.json
  def new
    @alligator = Alligator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @alligator }
    end
  end

  # GET /alligators/1/edit
  def edit
    @alligator = Alligator.find(params[:id])
  end

  # POST /alligators
  # POST /alligators.json
  def create
    @alligator = Alligator.new(params[:alligator])

    respond_to do |format|
      if @alligator.save
        format.html { redirect_to @alligator, notice: 'Alligator was successfully created.' }
        format.json { render json: @alligator, status: :created, location: @alligator }
      else
        format.html { render action: "new" }
        format.json { render json: @alligator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /alligators/1
  # PUT /alligators/1.json
  def update
    @alligator = Alligator.find(params[:id])

    respond_to do |format|
      if @alligator.update_attributes(params[:alligator])
        format.html { redirect_to @alligator, notice: 'Alligator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @alligator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alligators/1
  # DELETE /alligators/1.json
  def destroy
    @alligator = Alligator.find(params[:id])
    @alligator.destroy

    respond_to do |format|
      format.html { redirect_to alligators_url }
      format.json { head :no_content }
    end
  end
end
