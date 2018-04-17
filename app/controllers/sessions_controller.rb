class SessionsController < ApplicationController
	def new
	end

	def create
		logged_in = !session[:user_id].nil?
		if logged_in then redirect_to user_url else redirect_to root_path end 
	end

	def destroy
		@current_user = nil
		redirect_to root_url
	end
end
