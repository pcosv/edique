class Project < ApplicationRecord
	has_many :tasks
	has_many :participations
	has_many :users, through: :participations
  validates_uniqueness_of :name

	scope :finished, -> { where(finished: true) }
	scope :not_finished, -> { where(finished: false) }

	def progress_percent
		tasks_count = self.tasks.count

		if tasks_count == 0
			return 0
		end

		completed_tasks_count = self.tasks.completed.count

		return 100*completed_tasks_count/tasks_count
	end
end