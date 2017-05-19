class User < ApplicationRecord
	has_many :participations
	has_many :projects, through: :participations
	has_many :tasks, through: :participations_task
end
