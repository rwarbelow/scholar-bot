class SwotReport < ActiveRecord::Base
	validates_inclusion_of :grade_check, :in => [true, false]
	validates_inclusion_of :scholar_hours_check, :in => [true, false]
	validates_inclusion_of :procedure_practices_check, :in => [true, false]
	validates_inclusion_of :behavior_check, :in => [true, false]
	validates_inclusion_of :home_check, :in => [true, false]
	validates_inclusion_of :paper_check, :in => [true, false]

	belongs_to :guardianship
	default_scope { order('updated_at DESC') }
end
