class StudentAction < ActiveRecord::Base
	belongs_to :enrollment
	belongs_to :student
end
