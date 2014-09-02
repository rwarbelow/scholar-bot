module ScholarHoursHelper
	def current_teacher_selector(f)
		f.collection_select(:teacher_id, 
											Teacher.all, 
											:id, 
											:last_name, 
											{ include_blank: true, :required => true, selected: current_teacher.id },  
											{ class: 'chosen-select' })
	end
end
