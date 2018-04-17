class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    user = User.new user_params
	    if user.save
	    	flash[:notice] = "success"
	    	redirect_to root_path
	    else
	    	flash[:notice] = "error"
	    	redirect_to registrations_url
	    end

	end

	private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:registrations).permit(:name, :last_name, :email, :phone, :password)
    end
end
