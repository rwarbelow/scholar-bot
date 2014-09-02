class ProcedurePractice < ActiveRecord::Base
	belongs_to :student
	belongs_to :teacher

	default_scope { order('date_assigned DESC') }
	scope :unserved, -> { where(date_served: nil)}

	def served?
		!date_served.nil?
	end

	def unserved?
		date_served.nil?
	end

	def self.unserved
		all.select(&:unserved?).sort_by { |pp| [pp.student.last_name, pp.date_assigned] }
	end

	def self.completed
		all.select(&:served?).sort_by { |pp| [pp.student.last_name, pp.date_assigned] }
	end
end
