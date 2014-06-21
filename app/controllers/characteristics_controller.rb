class CharacteristicsController < ApplicationController
	
	def index
		@characteristics = Characteristic.all
	end

	def new
	end

	def show
		@characteristic = Characteristic.find(params[:id])
	end

	def create
		@characteristic = Characteristic.new(characteristic_params)

		@characteristic.save
		render 'show'
	end

	def edit
		@characteristic = Characteristic.find(params[:id])
	end

	def update
		@characteristic = Characteristic.find(params[:id])

		if @characteristic.update(characteristic_params)
			redirect_to(action: 'show', id: @characteristic.id) 
		else
			render 'edit'
		end
	end

	def delete
		@characteristic = Characteristic.find(params[:id])
		@characteristic.destroy

		redirect_to(action: 'index') 
	end

private

	def characteristic_params
		params.require(:characteristic).permit(:name)
	end
end
