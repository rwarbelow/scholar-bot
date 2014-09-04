class Action < ActiveRecord::Base
	has_many :action_core_values
	has_many :core_values, through: :action_core_values
	has_many :student_actions

	scope :common_positive_actions, -> { where(value: true, grouping: "primary") }
	scope :common_negative_actions, -> { where(value: false, grouping: "primary") }
	scope :secondary_positive_actions, -> { where(value: true, grouping: "secondary") }
	scope :secondary_negative_actions, -> { where(value: false, grouping: "secondary") }

	scope :positive, -> { where(value: true)}
	scope :negative, -> { where(value: false)}
end

