class ScholarHour < ActiveRecord::Base
	has_many :student_actions
	belongs_to :student
end
