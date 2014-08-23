class Students::BaseController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_filter :require_student

  def require_student
    unless current_user && current_user.student?
      redirect_to root_path
    end
  end

  def index
    @students = Student.all
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
      redirect_to @student, notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end

  private
  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email, :id_num, :dob, :grade, :gender)
  end
end
