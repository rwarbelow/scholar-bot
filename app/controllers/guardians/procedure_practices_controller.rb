class Guardians::ProcedurePracticesController < Guardians::BaseController
	def set_student
		begin
			@student = current_user.students.find(params[:student_id])
		rescue ActiveRecord::RecordNotFound
			redirect_to guardians_root_path
		end
	end

	def index
		set_student
	end
end
