class ApplicationController < ActionController::Base
  protect_from_forgery
  http_basic_authenticate_with :name => "LsmsaAdmin", :password => "eagles"
  helper_method :sort_column, :sort_direction
  
  def index
  	@prospies = prospies.order(sort_column + ' ' + sort_direction)
  end
  
  private
  
  def sort_column
 		Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
  		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
