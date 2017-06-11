class User < ApplicationRecord
	has_many :participations
	has_many :projects, through: :participations

	has_many :participations_users
	has_many :tasks, through: :participations_users

	has_secure_password

	def full_name
		full_name = ""
		if self.first_name
			full_name += self.first_name + " "
		end

		if self.last_name
			full_name += self.last_name
		end
		
		return full_name
	end
end
