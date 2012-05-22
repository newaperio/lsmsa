class ProspiesController < ApplicationController
  # GET /prospies
  # GET /prospies.json
  def index
    @prospies = Prospy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prospies }
    end
  end

  # GET /prospies/1
  # GET /prospies/1.json
  def show
    @prospy = Prospy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prospy }
    end
  end

  # GET /prospies/new
  # GET /prospies/new.json
  def new
    @prospy = Prospy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prospy }
    end
  end

  # GET /prospies/1/edit
  def edit
    @prospy = Prospy.find(params[:id])
  end

  # POST /prospies
  # POST /prospies.json
  def create
    @prospy = Prospy.new(params[:prospy])

    respond_to do |format|
      if @prospy.save
        InterestedStudent.sending_email(@prospy).deliver
        format.html { redirect_to @prospy, notice: 'Prospy was successfully created.' }
        format.json { render json: @prospy, status: :created, location: @prospy }
      else
        format.html { render action: "new" }
        format.json { render json: @prospy.errors, status: :unprocessable_entity }
      end
    end
  end
  # PUT /prospies/1
  # PUT /prospies/1.json
  def update
    @prospy = Prospy.find(params[:id])

    respond_to do |format|
      if @prospy.update_attributes(params[:prospy])
        format.html { redirect_to @prospy, notice: 'Prospy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @prospy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prospies/1
  # DELETE /prospies/1.json
  def destroy
    @prospy = Prospy.find(params[:id])
    @prospy.destroy

    respond_to do |format|
      format.html { redirect_to prospies_url }
      format.json { head :no_content }
    end
  end
  def export
  	require 'csv'
  	@prospies = Prospy.find(:all)
  	csv = CSV.generate(:force_quotes => true) do |line|
  		line << ["Email"]
  		line << @prospies.map { |prospies|prospies.to_csv }.flatten 
  	end 
  	send_data csv,
        :type => 'text/csv; charset=iso-8859-1; header=present',
        :disposition => "attachment; filename=prospies-#{Time.now.strftime('%d-%m-%y--%H-%M')}.csv"
    end
  end
end

