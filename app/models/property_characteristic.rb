class PropertyCharacteristic < ActiveRecord::Base

	belongs_to :property, dependent: :destroy
	belongs_to :characteristic
end
