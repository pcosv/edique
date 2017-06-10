class Project < ApplicationRecord
	has_many :tasks
	has_many :participations
	has_many :users, through: :participations

	scope :finished, -> { where(finished: true) }
	scope :not_finished, -> { where(finished: false) }
end