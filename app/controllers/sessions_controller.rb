class SessionsController < ApplicationController
	def new
	end

	def create
    user = User.find_by(email: create_params[:email])
    if user && user.confirm_password(create_params[:password])
      flash[:notice] = 'Login Done'
      redirect_to user
    else
      flash[:notice] = 'Error'
      redirect_to root_path
    end
	end

	def destroy
		@current_user = nil
		redirect_to root_url
  end

  private
  def create_params
    params.require(:session).permit(:email, :password)
  end
end
