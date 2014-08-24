class Course < ActiveRecord::Base
	belongs_to :teacher
	belongs_to :period
	has_many :enrollments
	has_many :students, through: :enrollments
end
