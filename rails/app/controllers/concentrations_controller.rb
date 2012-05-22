class ConcentrationsController < ApplicationController
  # GET /concentrations
  # GET /concentrations.json
  def index
    @concentrations = Concentration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @concentrations }
    end
  end

  # GET /concentrations/1
  # GET /concentrations/1.json
  def show
    @concentration = Concentration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @concentration }
    end
  end

  # GET /concentrations/new
  # GET /concentrations/new.json
  def new
    @concentration = Concentration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @concentration }
    end
  end

  # GET /concentrations/1/edit
  def edit
    @concentration = Concentration.find(params[:id])
  end

  # POST /concentrations
  # POST /concentrations.json
  def create
    @concentration = Concentration.new(params[:concentration])

    respond_to do |format|
      if @concentration.save
        format.html { redirect_to @concentration, notice: 'Concentration was successfully created.' }
        format.json { render json: @concentration, status: :created, location: @concentration }
      else
        format.html { render action: "new" }
        format.json { render json: @concentration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /concentrations/1
  # PUT /concentrations/1.json
  def update
    @concentration = Concentration.find(params[:id])

    respond_to do |format|
      if @concentration.update_attributes(params[:concentration])
        format.html { redirect_to @concentration, notice: 'Concentration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @concentration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concentrations/1
  # DELETE /concentrations/1.json
  def destroy
    @concentration = Concentration.find(params[:id])
    @concentration.destroy

    respond_to do |format|
      format.html { redirect_to concentrations_url }
      format.json { head :no_content }
    end
  end
end
