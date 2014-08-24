module User
	def increase_login_counter
		login_counter += 1
	end

	def admin?
		(self.is_a?(Teacher)) && (self.is_admin == true) ? true : false
	end

	def student?
		true if self.is_a?(Student)
	end

	def full_name
		"#{first_name} #{last_name}"
	end
end
