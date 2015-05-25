class TownsController < ApplicationController
	
	def index
		@towns = []
		if params[:state] && params[:state] != ""
			nation_name = params[:nation]
			state_name = params[:state]
			state = Nation.find_by_name(nation_name)
					.states.find_by_name(state_name)

			@towns = state.towns.all
		end
	end

	def show
		@state = State.find(params[:state_id])
		@town = @state.towns.find(params[:id])
	end
	
	def new
		@state = State.find(params[:state_id])
		@town = Town.new
	end

	def create
		@state = State.find(params[:state_id])
		
		if @state.towns.create(town_params)
			redirect_to state_path(@state)
		else 
			render 'new'
		end
	end

	def edit
		@state = State.find(params[:state_id])
		@town = @state.towns.find(params[:id])
	end

	def update
		@state = State.find(params[:state_id])
		@town = state.towns.find(params[:id])

		if @town.update(town_params)
			redirect_to state_path(@state)
		else
			render 'edit'
		end
	end

	def destroy
		@state = State.find(params[:state_id])
		@town = state.towns.find(params[:id])

		@town.destroy
		redirect_to state_path(@state)
	end

	private 
		def town_params
			params.require(:town).permit(:name)
		end
end
