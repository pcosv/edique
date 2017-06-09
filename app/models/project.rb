class Project < ApplicationRecord
	has_many :tasks
	has_many :participations
	has_many :users, through: :participations
end
