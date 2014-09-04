class ScholarHour < ActiveRecord::Base
	validates :student_id, 			presence: true
	validates :reason, 					presence: true
	validates :teacher_id, 			presence: true
	validates :date_assigned, 	presence: true
	has_many :student_actions
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
		all.select(&:unserved?).sort_by { |sh| [sh.student.last_name, sh.date_assigned] }
	end

	def self.completed
		all.select(&:served?).sort_by { |sh| [sh.student.last_name, sh.date_assigned] }
	end
end
