class Task < ApplicationRecord
	belongs_to :project

	has_many :participations_users
	has_many :users, through: :participations_users

	scope :idle, -> { left_outer_joins(:participations_users).where( participations_users: { id: nil} ) }

	scope :by_user, lambda { |user|
		left_outer_joins(:participations_users).where( participations_users: { user_id: user.id })
	}

	scope :not_by_user, lambda { |user|
		where.not(id: by_user(user)).where.not(id: idle)
	}

	scope :completed, -> { where(completed: true) }
end