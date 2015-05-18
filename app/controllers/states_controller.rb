class StatesController < ApplicationController
	# GET /state/
	def index
		@states = State.all
	end

	# GET /state/:id
	def show
		@state = State.find(params[:id])
	end

	# GET /state/new
	def new
		@state = State.new
	end

	# POST /state/new
	def create
		@state = State.new(state_params)

		if @state.save
			redirect_to @state
		else 
			render 'new'
		end
	end

	# GET /state/:id/edit
	def edit 
		@state = State.find(params[:id])
	end

	# PATCH /state/:id/edit
	def update
		@state = State.find(params[:id])

		if @state.update(state_params)
			redirect_to @state
		else 
			render 'edit'
		end
	end

	# DELETE /state/:id/destroy
	def destroy
		@state = State.find(params[:id])
		@state.destroy

		redirect_to states_path
	end
	private 
		def state_params
			params.require(:state).permit(:name)
		end
end
