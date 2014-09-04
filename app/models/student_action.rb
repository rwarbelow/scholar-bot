class StudentAction < ActiveRecord::Base
	validates :enrollment_id, 			presence: true
	validates :action_id, 					presence: true
	validates :date, 								presence: true
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

