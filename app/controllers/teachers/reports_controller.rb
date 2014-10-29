class Teachers::ReportsController < Teachers::BaseController
	def index
		@students = Student.all
		@core_values = CoreValue.all
	end
end
