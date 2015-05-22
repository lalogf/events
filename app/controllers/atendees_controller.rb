class AtendeesController < ApplicationController
	before_action :set_atendee, only: [:edit, :update, :destroy, :show]

	def index
		@atendees = Atendee.all
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
		@atendee.update(atendee_params)
		
		respond_to do |format|
			
			if @atendee.save 
				flash[:success] = "El invitado <b>" + @atendee.name + " "+ @atendee.lastname+ "</b> se ha actualizado con éxito"
				format.html { redirect_to root_path}
			else
				flash[:error] = "Hubo un error"
				format.html { render :edit}
			end
		end
	end
	def destroy
		@atendee.destroy
		respond_to do |format|
			flash[:alert] = "El invitado <b> " + @atendee.name + " " + @atendee.lastname+ " </b> se ha actualizado con éxito."
			format.html { redirect_to atendees_path}
		end

		
	end
	private
	def atendee_params
		params.require(:atendee).permit(:name,:lastname, :email, :phone, :company)
	end
	def set_atendee
		@atendee = Atendee.find(params[:id])
	end
end
