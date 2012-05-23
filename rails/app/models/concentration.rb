class Concentration < ActiveRecord::Base
	validates :name, :presence => true
	has_many :prospies
end
