class Teachers::ProcedurePracticesController < Teachers::BaseController
  def index
  	@unserved_procedure_practices = ProcedurePractice.unserved
  end

  def new
  	@procedure_practice = ProcedurePractice.new
  end

  def create
  	@procedure_practice = ProcedurePractice.new(procedure_practice_params)
  	if @procedure_practice.save
  		redirect_to teachers_procedure_practices_path
  	else
  		render :new
  	end
  end

  def edit
    @procedure_practice = ProcedurePractice.find(params[:id])
  end

  def update
    @procedure_practice = ProcedurePractice.find(params[:id])
    @procedure_practice.update(procedure_practice_params)
    redirect_to teachers_procedure_practices_path
  end

  def destroy
    @procedure_practice = ProcedurePractice.find(params[:id])
    @procedure_practice.destroy
    redirect_to teachers_procedure_practices_path
  end

  def complete
    @procedure_practice = ProcedurePractice.find(params[:procedure_practice_id])
    @procedure_practice.date_served = Date.today
    @procedure_practice.save
    redirect_to teachers_procedure_practices_path
  end

  def completed
    @completed_procedure_practices = ProcedurePractice.completed
  end

  private
  def procedure_practice_params
  	params.require(:procedure_practice).permit(:student_id, :teacher_id, :procedure, :description, :date_assigned, :date_served)
  end
end
