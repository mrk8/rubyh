class Task < ActiveRecord::Base
	validates :title, presence: true
	module Status
		NOT_STARTED = 0
		STARTED = 1
		FINISHED = 2
	end

end
