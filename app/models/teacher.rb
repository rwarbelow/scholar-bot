class Teacher < ActiveRecord::Base
	validates :first_name, 		presence: true
	validates :last_name, 		presence: true
	validates :title, 				presence: true
	validates :email, 				presence: true
	validates :username, 			presence: true, 
														uniqueness: true
														
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
