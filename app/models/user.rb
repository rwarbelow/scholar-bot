module User
	def increase_login_counter
		login_counter += 1
	end

	def admin?
		(self.is_a?(Teacher)) && (self.is_admin == true)
	end

	def student?
		self.is_a?(Student)
	end

	def teacher?
		self.is_a?(Teacher)
	end

	def full_name
		"#{first_name} #{last_name}"
	end
end
