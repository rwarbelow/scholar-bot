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

	def create_guardianships(student_ids)
		student_ids.each { |id| guardianships.create(student_id: id) }
	end

	def generate_code
  	self.code = loop do
  		possible = (('A'..'Z').to_a + (0..9).to_a + ('a'..'z').to_a)
  		random_token = (0...6).map { |n| possible.sample }.join
  		break random_token unless Guardian.where(code: random_token).exists?
  	end
  	p self
  end
end
