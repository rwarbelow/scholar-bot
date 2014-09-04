class Course < ActiveRecord::Base
	validates :teacher_id, 			presence: true
	validates :subject,					presence: true
	validates :period_id, 			presence: true

	belongs_to :teacher
	belongs_to :period
	has_many :enrollments
	has_many :students, through: :enrollments
	has_many :student_actions, through: :enrollments

	default_scope { order('period_id ASC') }
end
