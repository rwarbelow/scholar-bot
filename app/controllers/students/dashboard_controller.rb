class Students::DashboardController < Students::BaseController
  def index
  	@core_values = CoreValue.all
  	@student = current_user
  end
end
