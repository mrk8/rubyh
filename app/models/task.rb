class Task < ActiveRecord::Base
	
	module Status
		NOT_STARTED = 0
		STARTED = 1
		FINISHED = 2
	end

# scopes for prewritten queries
	scope :not_started, -> {where(status: Status::NOT_STARTED)}
	scope :started, -> {where(status: Status::STARTED)}
	scope :finished, -> {where(status: Status::FINISHED)}

# validate title
	validates :title, presence: true

# define status of input from user on views/tasks/index
	def not_started?
		self.status == Status::NOT_STARTED
	end

	def started?
		self.status == Status::STARTED
	end


end
