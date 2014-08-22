class Student < ActiveRecord::Base
	validates :first_name, 		presence: true
	validates :last_name, 		presence: true
	validates :username, 			presence: true, 
														uniqueness: true

	validates :gender, 				presence: true
	validates :dob, 					presence: true
	validates :id_num, 				presence: true, 
														uniqueness: true

	validates :grade, 				presence: true

	before_validation :downcase_username
	has_secure_password

	def downcase_username
		username = username.downcase if username.present?
	end
end
