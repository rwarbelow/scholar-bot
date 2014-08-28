class Teachers::LiveController < Teachers::BaseController
	before_action :set_course

	def classroom
		@actions 		= Action.all
	end

	def update
		respond_to do |format|
			format.html { redirect_to root_path }
			format.json  do
				enrollment_ids = params[:enrollment_ids]
				action 	       = Action.find(params[:action_id])

				enrollment_ids.map do |id|
					StudentAction.create!(enrollment_id: id.to_i, action_id: action.id, date: Date.today)
				end

				render :json => {
					status: :ok,
					enrollmentIds: enrollment_ids,
					actionType: action.name.capitalize
					}.to_json
			end
		end
	end

	private
	def set_course
		@course = current_teacher.courses.find { |course| course.id == params[:course_id].to_i } 
	end

end

