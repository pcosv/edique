class User < ApplicationRecord
	has_many :participations
	has_many :projects, through: :participations

	has_many :participations_users
	has_many :tasks, through: :participations_users
end
