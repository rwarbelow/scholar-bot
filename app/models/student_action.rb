class StudentAction < ActiveRecord::Base
	belongs_to :enrollment
	belongs_to :student
	belongs_to :action
	belongs_to :course

	default_scope { order('updated_at DESC') }

	def name
		action.name
	end
end
