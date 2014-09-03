class Teachers::TeachersController < Teachers::BaseController
	before_action :set_teacher

	def index
	end

	def edit
	end

  def update
    if @teacher.update(teacher_params)
      redirect_to teachers_teachers_path, notice: 'Teacher was successfully updated.'
    else
      render :show
    end
  end

	private
	def set_teacher
		@teacher = current_teacher
	end

  def teacher_params
    params.require(:teacher).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email, :title)
  end
end
