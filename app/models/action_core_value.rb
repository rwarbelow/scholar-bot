class ActionCoreValue < ActiveRecord::Base
	belongs_to :action
	belongs_to :core_value
	has_many :student_actions, through: :actions
end
