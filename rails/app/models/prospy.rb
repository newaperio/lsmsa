class Prospy < ActiveRecord::Base
	validates :email, :presence => true, :format => { :with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i, :message => "Not a Valid Email" }
	belongs_to :concentration
end
