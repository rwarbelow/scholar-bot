class Teachers::StudentActionsController < Teachers::BaseController
	before_action :set_student_action, only: [:show, :edit, :update, :destroy]

	def index
		@course = current_teacher.courses.find_by(id: params[:course_id])
		@student_actions = @course.student_actions
	end

	def show
	end

	def new
		@student_action = StudentAction.new
	end

	def edit
	end

	def create
		@student_action = StudentAction.new(student_action_params)
		if @student_action.save
			redirect_to teachers_course_student_actions_path(@student_action.enrollment.course), notice: 'Action was successfully created.'
		else
			render :new
		end
	end

	def update
		p params
		if @student_action.update(student_action_params)
			redirect_to teachers_course_student_actions_path(@student_action.enrollment.course), notice: 'Action was successfully updated.'
		else
			render :edit
		end
	end

	def destroy
		@student_action.destroy
		redirect_to teachers_course_student_actions_path(@student_action.enrollment.course), notice: 'Action was successfully destroyed.'
	end

	private
	def set_student_action
		@student_action = StudentAction.find(params[:id])
	end

	def student_action_params
		params.require(:student_action).permit(:enrollment_id, :action_id, :comment, :date)
	end
end
