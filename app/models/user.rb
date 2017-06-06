class User < ApplicationRecord
	has_many :participations
	has_many :projects, through: :participations

	has_many :participations_task
	has_many :tasks, through: :participations_task
end
