class SessionsController < ApplicationController

	def create
		user_type = params[:type]
		@user = user_type.classify.constantize.find_by(username: params[:username].downcase)
  	if @user && @user.authenticate(params[:password])
      session["#{user_type}_id".to_sym] = @user.id
      session[:user_type] = user_type
      @user.login_counter += 1
      dashboard
    else
      flash[:errors] = "Invalid Login."
      render 'sessions/new'
    end

	end

	def destroy
   session.clear
   flash[:notice] = "Logout Successful."
   redirect_to root_path
 	end

  def dashboard
    if current_student?
      redirect_to students_root_path
    elsif current_guardian?
      redirect_to guardians_root_path
    elsif current_admin?
      redirect_to admins_root_path
    elsif current_teacher?
      redirect_to teachers_root_path
    else
      redirect_to root_path
    end
  end
end
