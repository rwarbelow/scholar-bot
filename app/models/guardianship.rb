class Guardianship < ActiveRecord::Base
	belongs_to :student
	belongs_to :guardian
	has_many :swot_reports
end
