class Enrollment < ActiveRecord::Base
	belongs_to :student
	belongs_to :period
	belongs_to :course
	default_scope { order('period_id ASC') }
end
