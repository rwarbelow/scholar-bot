module EnrollmentsHelper
	def current_course_selector_for(enrollment)
		collection_select(:periods_courses, 
											enrollment.id, 
											courses_available_for(enrollment.period.id), 
											:id, 
											:subject, 
											{ include_blank: true, :required => true, selected: enrollment.course_id },  
											{ class: 'chosen-select' })
	end
end
