class StudentAction < ActiveRecord::Base
	belongs_to :enrollment
	belongs_to :action
	belongs_to :course

	has_one :student, through: :enrollment
	has_one :action_core_value, through: :action

	default_scope { order('updated_at DESC') }

	def name
		action.name
	end

	def action_idcore_values
		action.action_core_values
	end
end

# student_action = StudentAction.first
# student_action.core_values

# SELECT  "actions".* FROM "actions"  WHERE "actions"."id" = $1 LIMIT 1  [["id", 16]]
# SELECT "core_values".* FROM "core_values" INNER JOIN "action_core_values" ON "core_values"."id" = "action_core_values"."core_value_id" WHERE "action_core_values"."action_id" = $1  [["action_id", 16]]
