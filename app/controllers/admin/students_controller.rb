class Admin::StudentsController < Admin::BaseController
	before_action :set_student, only: [:show, :edit, :update, :destroy]

	def require_student
		unless current_user && current_user.student?
			redirect_to root_path
		end
	end

	def index
		@students = Student.order(:grade, :last_name)
	end

	def show
	end

	def new
		@student = Student.new
	end

	def edit
	end

	def create
		@student = Student.new(student_params)
		if @student.save
			@student.create_enrollments
			redirect_to admin_students_path, notice: 'Student was successfully created.'
		else
			render :new
		end
	end

	def update
		if @student.update(student_params)
			redirect_to admin_student_path(@student), notice: 'Student was successfully updated.'
		else
			render :edit
		end
	end

	def destroy
		@student.destroy
		redirect_to admin_students_url, notice: 'Student was successfully destroyed.'
	end

	def load_students
		file = params[:file]
		p "before load"
		Student.load_students(file)
		p "after load"
		redirect_to admin_root_path
	end

	def download_students
		@students = Student.all
		respond_to do |format|
			format.csv { send_data @students.as_csv, filename: 'student_roster.csv' }
		end
	end

	def assign_student_courses
		@student = Student.find(params[:student_id])
		periods_courses = params[:periods_courses]
		@student.enroll_in_courses(periods_courses)
		redirect_to admin_student_path(@student), notice: 'Course schedule was updated.'
	end

	private
	def set_student
		@student = Student.find(params[:id])
	end

	def student_params
		params.require(:student).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email, :id_num, :dob, :grade, :gender)
	end
end
