class Guardians::StudentsController < Guardians::BaseController

	def set_student
		begin
			@student = current_user.students.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			redirect_to guardians_root_path
		end
	end

	def view_student
		student = current_user.students.find(params[:student_id])
		redirect_to new_guardians_student_swot_report_path(student.id)
	end

	def show
		set_student
	end

	def behavior
		set_student
	end
end
