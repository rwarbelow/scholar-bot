class Admin::CoursesController < Admin::BaseController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_teachers, only: [:edit, :new]
  before_action :set_periods, only: [:edit, :new]

  def index
    sort_attribute = params[:sort].nil? ? :period_id : params[:sort]
    @courses = Course.order(sort_attribute)
  end

  def show
    @available_students = Student.available_for(@course)
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def assign_students
    p params
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
    @course = Course.find(params[:id])
  end

  def set_teachers
    @teachers = Teacher.all
  end

  def set_periods
    @periods = Period.all
  end

  def course_params
    params.require(:course).permit(:teacher_id, :period_id, :subject)
  end
end
