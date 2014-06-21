class Property < ActiveRecord::Base

	has_many :property_characteristics
	has_many :characteristics, through: :property_characteristics
end
