class Teacher < ActiveRecord::Base
	include User
	validates :first_name, 		presence: true
	validates :last_name, 		presence: true
	validates :title, 				presence: true
	validates :email, 				presence: true
	validates :username, 			presence: true, 
														uniqueness: true

	has_many :courses
	has_many :enrollments, through: :courses
	has_many :students, through: :enrollments
	has_many :scholar_hours
														
	has_secure_password
	before_validation :downcase_username

	def downcase_username
		username = username.downcase if username.present?
	end

	def is_admin?
		is_admin
	end

	def increase_login
		login_counter += 1
	end
end
