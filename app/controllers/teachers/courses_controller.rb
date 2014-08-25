class Teachers::CoursesController < Teachers::BaseController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :student_actions, :roster]

  def index
    @courses = current_user.courses
  end

  def roster
  end

  def show
  end

  def new
    @course = Course.new
  end

  def student_actions
    limit = params[:limit] || 100
    @student_actions = @course.student_actions.limit(limit)
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to admin_course_path(@course), notice: 'Course was successfully created.'
    else
      render :new
    end
  end

  def update
    if @course.update(course_params)
      redirect_to admin_course_path(@course), notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to admin_courses_url, notice: 'Course was successfully destroyed.'
  end

  private
  def set_course
    id = params[:id] || params[:course_id]
    @course = current_teacher.courses.find_by(id: id)
  end

  def course_params
    params.require(:course).permit(:teacher_id, :period_id, :subject)
  end
end
