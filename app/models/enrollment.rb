class Enrollment < ActiveRecord::Base
	validates :student_id, 			presence: true
	validates :period_id, 			presence: true

	belongs_to :student
	belongs_to :period
	belongs_to :course
	has_many :student_actions
	belongs_to :teacher
	default_scope { order('period_id ASC') }

	def self.available_for(course)
		all.select do |enrollment|
			enrollment if enrollment.period_id == course.period_id && enrollment.course_id.nil?
		end
	end

	def full_name
		"#{student.full_name}"
	end
end
