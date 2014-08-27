class CoreValue < ActiveRecord::Base
	has_many :action_core_values
	has_many :actions, through: :action_core_values
end
