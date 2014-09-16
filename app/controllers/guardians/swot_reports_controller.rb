class Guardians::SwotReportsController < Guardians::BaseController

	def set_student
		begin
			@student = current_user.students.find(params[:student_id])
		rescue ActiveRecord::RecordNotFound
			redirect_to guardians_root_path
		end
	end

	def view_student
		student = current_user.students.find(params[:student_id])
		redirect_to guardians_student_path(student.id)
	end

	def new
		@swot_report = SwotReport.new
		set_student
	end
	
	def create
		set_student
		@swot_report = SwotReport.new(swot_report_params)
		if @swot_report.save
			redirect_to guardians_student_swot_reports_path(@student.id)
		else
			render :new
		end
	end

	def index
		set_student
	end

	def show
		set_student
	end

	private

	def swot_report_params
		params.require(:swot_report).permit(:grade_check, :procedure_practices_check, :scholar_hours_check, :behavior_check, :home_check, :paper_check, :comments, :guardianship_id, :name)
	end
end
