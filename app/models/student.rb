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
	has_many :periods, through: :enrollments
	has_many :courses, through: :periods
	has_many :teachers, through: :courses
	has_many :student_actions
	has_many :guardianships
	has_many :guardians, through: :guardianships


	before_validation :downcase_username
	has_secure_password

	def downcase_username
		username = username.downcase if username.present?
	end

	def self.load_students(file)
		CSV.foreach(file.path, headers:true, header_converters: :symbol) do |row|
			student = Student.create(
				first_name: row[:first_name],
				last_name: 	row[:last_name],
				id_num: 		row[:id_num],
				dob: 				row[:dob],
				grade: 			row[:grade],
				gender: 		row[:gender],
				username: 	"#{row[:first_name][0]}#{row[:last_name]}#{row[:id_num]}",
				password: 	row[:id_num],
				password_confirmation: row[:id_num],
				login_counter: 0
				)
			Period.all.each do |p|
				student.enrollments.create(period_id: p.id)
			end
			student.save
		end
	end
end
