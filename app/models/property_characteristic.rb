class PropertyCharacteristic < ActiveRecord::Base

	belongs_to :property
	belongs_to :characteristic
end
