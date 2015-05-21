class EventsController < ApplicationController
	before_action :set_event, only: [:edit, :update, :show, :destroy]

	def index
		@events = Event.all
		@event = Event.new
	end
	def new
	end
	def create
		@event = Event.create(event_params)
		respond_to do |format|
		
			if @event.save 

				flash[:success] = "El evento <b>" + @event.name + "</b> se ha creado con éxito."
				format.html { redirect_to root_path}
			else 
				flash[:error] = "Hubo un problema"
				format.html { render :index}
			end
		end
	end
	def edit
		
	end
	def update
		
	end
	def destroy
		 @event.destroy
    	respond_to do |format|
    		flash[:success] = "El evento <b>" + @event.name + "</b> fue eliminado."
      		format.html { redirect_to root_path }
    	end
	end
	private
	def event_params
		params.require(:event).permit(:name,:location,:date)
	end
	def set_event
		@event = Event.find(params[:id])
	end
end
