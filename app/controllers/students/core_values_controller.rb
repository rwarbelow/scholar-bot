class Students::CoreValuesController < Students::BaseController
  def show
  	@core_value = CoreValue.find(params[:id])
  end
end
