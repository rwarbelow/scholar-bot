class Course < ActiveRecord::Base
	belongs_to :teacher
	belongs_to :period
	has_many :enrollments
	has_many :students, through: :enrollments
	has_many :student_actions, through: :enrollments

	default_scope { order('period_id ASC') }
end
