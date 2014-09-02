require 'csv'

class Student < ActiveRecord::Base
	include User
	validates :first_name, 		presence: true
	validates :last_name, 		presence: true
	validates :username, 			presence: true, uniqueness: true
	validates :gender, 				presence: true
	validates :dob, 					presence: true
	validates :id_num, 				presence: true, uniqueness: true
	validates :grade, 				presence: true

	has_many :enrollments
	has_many :courses, through: :enrollments
	has_many :student_actions, through: :enrollments
	has_many :teachers, through: :courses
	has_many :student_actions, through: :enrollments
	has_many :guardianships
	has_many :guardians, through: :guardianships
	has_many :scholar_hours

	default_scope { order('last_name ASC') }

	before_validation :downcase_username
	has_secure_password

	def downcase_username
		username = username.downcase if username.present?
	end

	def enroll_in_courses(enrollments_courses)
		enrollments_courses.each do |e_id, c_id|
			enrollment = Enrollment.find(e_id)
			enrollment.course_id = c_id
			enrollment.save
		end
	end

	def self.load_students(file)
		csv = CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
			next if row.any? { |attribute| attribute[1].nil? }
			year,month,day = row[:dob].split("-")
			student = Student.create!(
				first_name: row[:first_name].capitalize,
				last_name: 	row[:last_name].capitalize,
				id_num: 		row[:id_num],
				dob: 				row[:dob],
				grade: 			row[:grade],
				gender: 		row[:gender].downcase,
				username: 	"#{row[:first_name].downcase[0]}#{row[:last_name].downcase}#{month}#{day}",
				password: 	row[:id_num],
				password_confirmation: row[:id_num],
				login_counter: 0
				)
			student.create_enrollments
			student.save
		end
	end

	def positive_actions_in(core_value_id, limit = 50)
		student_actions.limit(limit).select do |sa| 
			sa.action.core_values.where(id: core_value_id).any? && sa.action.value == true
		end
	end

	def negative_actions_in(core_value_id, limit = 50)
		student_actions.limit(limit).select do |sa| 
			sa.action.core_values.where(id: core_value_id).any? && sa.action.value == false
		end
	end

	def all_actions_in(core_value_id, limit = 50)
		student_actions.limit(limit).select do |sa| 
			sa.action.core_values.where(id: core_value_id).any?
		end
	end

	def all_negative_actions(limit = 100)
		student_actions.limit(limit).select do |sa| 
			sa.action.value == false
		end
	end

	def all_positive_actions(limit = 100)
		student_actions.limit(limit).select do |sa| 
			sa.action.value == true
		end
	end

	def create_enrollments
		Period.all.each do |p|
			enrollments.create(period_id: p.id)
		end
	end

	def self.as_csv
		CSV.generate do |csv|
			csv << %w(first_name last_name id_num dob grade gender)
			all.each do |student|
				csv << [student.first_name, student.last_name, student.id_num, student.dob, student.grade, student.gender]
			end
		end
	end

	def self.available_for(course)
		all.select do |student|
			enrollment = student.enrollments.find { |enrollment| enrollment.period_id == course.period_id }
			student if enrollment && enrollment.course_id.nil?
		end
	end

	def unserved_scholar_hours
		scholar_hours.where(date_served: nil)
	end
end
