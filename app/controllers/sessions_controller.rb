class SessionsController < ApplicationController

	def create
    session.clear
		user_type = params[:type]
		@user = user_type.classify.constantize.find_by(username: params[:username].downcase)
  	if @user && @user.authenticate(params[:password])
      session["#{user_type}_id".to_sym] = @user.id
      session[:user_type] = user_type
      @user.login_counter += 1
      dashboard
    else
      flash[:errors] = "Invalid Login."
      render 'home/index'
    end

	end

	def destroy
   session.clear
   flash[:notice] = "Logout Successful."
   redirect_to root_path
 	end
end
