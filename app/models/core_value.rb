class CoreValue < ActiveRecord::Base
	has_many :student_actions
	has_many :action_types
end
