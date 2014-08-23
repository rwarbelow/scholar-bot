class Admin::DashboardController < Admin::BaseController
	def index
		@students = Student.limit(10)
	end

	def load_students
		file = params[:file]
		Student.load_students(file)
		redirect_to admin_root_path
	end
end
