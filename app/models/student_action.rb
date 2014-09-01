class StudentAction < ActiveRecord::Base
	belongs_to :enrollment
	belongs_to :action
	belongs_to :course
	belongs_to :scholar_hour

	has_one :student, through: :enrollment
	has_one :action_core_value, through: :action

	default_scope { order('updated_at DESC') }

	def name
		action.name
	end
end

