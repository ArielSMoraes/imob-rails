class PropertiesController < ApplicationController

	def index
		@properties = Property.all
	end

	def new
	end

	def show
		@property = Property.find(params[:id])
	end

	def create
		@property = Property.new(property_params)

		@property.save
		render 'show'
	end

	def edit
		@property = Property.find(params[:id])
		@characteristics = Characteristic.where.not(id: @property.characteristics.map{|element| element.id})
	end

	def update
		@property = Property.find(params[:id])

		if @property.update(property_params)
			redirect_to(action: 'show', id: @property.id) 
		else
			render 'edit'
		end
	end

	def delete
		@property = Property.find(params[:id])
		@property.destroy

		redirect_to(action: 'index') 
	end

	def new_characteristic
		@property = Property.find(params[:id])
		@characteristic = Characteristic.find(params[:characteristic])

		@property.characteristics << [@characteristic]
		redirect_to(action: 'edit', id: @property.id) 
		
	end

	def remove_characteristic
		PropertyCharacteristic.where(:property_id => params[:property], :characteristic_id => params[:characteristic]).destroy_all
		redirect_to(action: 'edit', id: params[:property]) 
	end

private
	def property_params
		params.require(:property).permit(:cep, :endereco, :dormitorios, :financiado, :descricao, :numero, :characteristic)
	end

end
