class Admin::TeachersController < Admin::BaseController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @teachers = Teacher.all
  end

  def show
  end

  def new
    @teacher = Teacher.new
  end

  def edit
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to admin_teacher_path(@teacher), notice: 'Teacher was successfully created.'
    else
      render :new
    end
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to admin_teacher_path(@teacher), notice: 'Teacher was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @teacher.destroy
    redirect_to admin_teachers_url, notice: 'Teacher was successfully destroyed.'
  end

    def reset_password
    @teacher = Teacher.find(params[:teacher_id])
    @teacher.password = "password"
    @teacher.password_confirmation = "password"
    @teacher.save!
    redirect_to admin_teachers_path, notice: "#{@teacher.first_name}'s password was successfully reset."
  end

  private
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email, :title)
  end
end
