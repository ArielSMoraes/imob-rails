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

private
	def property_params
		params.require(:property).permit(:cep, :endereco, :dormitorios, :financiado, :descricao, :numero)
	end

end
