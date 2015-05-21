class AtendeesController < ApplicationController
	before_action :set_atendee, only: [:edit, :update, :destroy, :show]

	def index
		
	end
	def new
		@atendee = Atendee.new
	end
	def create
		@atendee = Atendee.create(atendee_params)
		
		respond_to do |format|
			if @atendee.save
				flash[:success] = "El invitado <b>"+ @atendee.name + " " + @atendee.lastname + "</b> ha sido creado con éxito"
				format.html {redirect_to root_path }
			else
				flash[:error] = "Hubo un error"
				format.html{ render :new}
			end
		
		end	
	end
	def edit
		
	end
	def update
		
	end
	def destroy
		
	end
	private
	def atendee_params
		params.require(:atendee).permit(:name,:lastname, :email, :phone, :company)
	end
	def set_atendee
		@atendee = Atendee.find(params[:id])
	end
end
