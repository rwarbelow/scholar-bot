module ApplicationHelper
  def current_user
  	if user_type
		  @current_user ||= user_type.classify.constantize.find_by(id: session["#{user_type}_id".to_sym])
  	end
  end

  def user_type
  	session[:user_type]
  end

  def current_admin
    current_user if (current_user.is_a?(Teacher) && current_user.admin)
  end

  def current_admin?
    !!current_admin
  end

  def current_student
    current_user if current_user.is_a?(Student)
  end

  def current_student?
    !!current_student
  end

  def current_teacher
    current_user if current_user.is_a?(Teacher)
  end

  def current_teacher?
    !!current_teacher
  end

  def current_guardian
    current_user if current_user.is_a?(Guardian)
  end

  def current_guardian?
    !!current_guardian
  end

  def dashboard
    if current_student?
      redirect_to students_root_path
    elsif current_guardian?
      redirect_to guardians_root_path
    elsif current_admin?
      redirect_to admins_root_path
    elsif current_teacher?
      redirect_to teachers_root_path
    else
      redirect_to root_path
    end
  end
end
