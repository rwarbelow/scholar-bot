class Teachers::CoreValuesController < Teachers::BaseController
  def show
  	@student = Student.find(params[:student_id])
  	@core_value = CoreValue.find(params[:id])
  end
end
