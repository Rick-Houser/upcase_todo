class Todo < ActiveRecord::Base
	def completed?
		completed_at?
	end

	def complete!
		touch :completed_at
	end
end
