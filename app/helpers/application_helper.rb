module ApplicationHelper
  def current_user
  	user_class = session[:user_type]
    @current_user ||= user_class.classify.constantize.find_by(id: session["#{user_class}_id".to_sym])
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
end
