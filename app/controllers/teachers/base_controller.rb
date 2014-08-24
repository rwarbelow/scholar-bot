class Teachers::BaseController < ApplicationController
	before_filter :require_teacher 

	def index
	end
	
	def require_teacher
    unless current_user && current_user.teacher?
      redirect_to root_path
    end
  end

	private
	
	def teacher_params
		params.require(:teacher).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email, :title)
	end
end
