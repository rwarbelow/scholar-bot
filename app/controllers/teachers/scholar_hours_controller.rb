class Teachers::ScholarHoursController < Teachers::BaseController
  def index
  	@unserved_scholar_hours = ScholarHour.unserved
  end

  def new
  	@scholar_hour = ScholarHour.new
  end

  def create
  	@scholar_hour = ScholarHour.new(scholar_hour_params)
  	if @scholar_hour.save
  		redirect_to teachers_scholar_hours_path
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def scholar_hour_params
  	params.require(:scholar_hour).permit(:student_id, :teacher_id, :reason, :description, :date_assigned, :date_served)
  end
end
