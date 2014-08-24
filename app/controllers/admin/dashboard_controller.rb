class Admin::DashboardController < Admin::BaseController
	def index
		@students = Student.all
	end

	# def load_students
	# 	file = params[:file]
	# 	Student.load_students(file)
	# 	redirect_to admin_root_path
	# end

	# def download_students
	# 	@students = Student.all
	# 	respond_to do |format|
	# 		format.csv { send_data @students.as_csv, filename: 'student_roster.csv' }
	# 	end
	# end
end
