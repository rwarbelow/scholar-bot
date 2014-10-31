class Teachers::ReportsController < Teachers::BaseController
	def index
		p params
		start = params[:start].to_i
		stop = params[:stop].to_i
		require 'pry'
		binding.pry
		@students = Student.where(:id => start..stop)
		@core_values = CoreValue.all
	end
end
