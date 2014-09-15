class Guardian < ActiveRecord::Base
	include User
	validates :first_name, 	presence: true
	validates :last_name, 	presence: true
	validates :username, 		presence: true, uniqueness: true
	
  has_many :guardianships
  has_many :students, through: :guardianships
  

  before_validation :downcase_username
	has_secure_password

	def downcase_username
		username = username.downcase if username.present?
	end
end
