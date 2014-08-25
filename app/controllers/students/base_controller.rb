class Students::BaseController < ApplicationController
  before_filter :require_student
  before_action :set_student

  def require_student
    unless current_user && current_user.student?
      redirect_to root_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  private
  def set_student
    @student = current_user
  end

  def student_params
    params.require(:student).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email, :id_num, :dob, :grade, :gender)
  end
end
