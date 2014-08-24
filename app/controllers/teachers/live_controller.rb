class Teachers::LiveController < Teachers::BaseController
	before_action :set_course

	def classroom
	end

	private
	def set_course
		@course = current_teacher.courses.find { |course| course.id == params[:course_id].to_i } 
	end
end
