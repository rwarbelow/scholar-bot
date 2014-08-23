class Teachers::BaseController < ApplicationController
	before_action :set_teacher, only: [:show, :edit, :update, :destroy]

	def index
	end
	
	private
	def set_teacher
		@teacher = Teacher.find(params[:id])
	end

	def teacher_params
		params.require(:teacher).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email, :title)
	end
end
