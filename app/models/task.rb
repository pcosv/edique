class Task < ApplicationRecord
	belongs_to :project
	has_many :users, through: :participations_users
end
