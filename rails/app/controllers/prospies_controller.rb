class ProspiesController < ApplicationController
  # GET /prospies
  # GET /prospies.json
  def index
    @prospies = Prospy.order("name").page(params[:page]).per(25)
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
        ProspyMailer.interest_notification(@prospy).deliver
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
  	@prospies = Prospy.all
  	csv_string = CSV.generate do |csv|
  		csv << [
  		"Name",
  		"Email",
  		"Telephone Number", 
  		"Address",
  		"City",
  		"State",
  		"Zip Code",
  		"Interest", 
  		"High School",
  		"Year",
  		"Concentration"
  		]
  		@prospies.each do |prospy|
  			csv << [
  			prospy.name,
  			prospy.email,
  			prospy.telephone_number,
  			prospy.address_1 + " " + prospy.address_2, 
  			prospy.cities,
  			prospy.state,
  			prospy.zip, 
  			prospy.interest,
  			prospy.high_school,
  			prospy.year,
  			prospy.concentration.name
  			]
  		end 
  	end 
	respond_to do |format|
  		format.csv { send_data(csv_string, :filename => "prospy_" + Time.now.strftime("%m-%d-%Y") + ".csv", :type => "text/csv") }
	end
  end
   

  
#   def index
#   	@prospies = Prospy.order(sort_column + ' ' + sort_direction)
#   end
end