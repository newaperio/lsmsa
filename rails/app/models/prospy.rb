class Prospy < ActiveRecord::Base
	validates :email, :presence => true, :format => { :with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i, :message => "is in the wrong formate" }
	validates :zip, :format => { :with => /^\d{5}(-\d{4})?$/, :message => "is in the wrong formate" }
 	validates :telephone_number, :format => { :with =>  /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/, :message => "is in the wrong formate" }
	belongs_to :concentration
end
