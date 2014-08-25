class Admin::DashboardController < Admin::BaseController
	def index
		@students = Student.all
	end
end
