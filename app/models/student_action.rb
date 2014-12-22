class StudentAction < ActiveRecord::Base
	validates :enrollment_id, 			presence: true
	validates :action_id, 					presence: true
	validates :date, 								presence: true
	belongs_to :enrollment
	belongs_to :action
	belongs_to :course
	belongs_to :scholar_hour

	has_one :student, through: :enrollment
	has_one :action_core_value, through: :action

	default_scope { order('updated_at DESC') }

	def name
		action.name
	end

	def self.to_csv
    CSV.generate do |csv|
      csv << ["date", "created_at", "student_id", "first_name", "last_name", "action", "class", "teacher"]
      all.each do |action|
        csv << [action.date, action.created_at, action.student.id_num, action.student.first_name, action.student.last_name, action.action.name, action.enrollment.course.subject, action.enrollment.course.teacher.last_name]
      end
    end
  end
end

