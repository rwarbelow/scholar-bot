class Teachers::StudentsController < Teachers::BaseController
	before_action :set_student, only: [:show, :edit, :update, :destroy]

	def view_student
		redirect_to teachers_student_path(params[:student_id])
	end

	def show
		@core_values = CoreValue.all
	end

	private
	def set_student
		@student = Student.find(params[:id])
	end
end
