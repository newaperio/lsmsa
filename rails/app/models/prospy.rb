class Prospy < ActiveRecord::Base
	validates :email, :presence => true, :format => { :with => //\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i/`.0-9]/,
   :message => "Not a Valid Email" }
	belongs_to :concentration
	belongs_to :year
end
