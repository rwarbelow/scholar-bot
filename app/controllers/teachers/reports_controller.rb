class Teachers::ReportsController < Teachers::BaseController
	def index
		start = params[:start].to_i
		stop = params[:stop].to_i
		@students = Student.where(:id => start..stop)
		@core_values = CoreValue.all
	end
end
