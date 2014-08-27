class Action < ActiveRecord::Base
	has_many :action_core_values
	has_many :core_values, through: :action_core_values
	
	def self.common_positive_actions
		common_positive_actions = []
		common_positive_actions << Action.find_by(name: "participation")
		common_positive_actions << Action.find_by(name: "working independently")
		common_positive_actions << Action.find_by(name: "problem-solving")
		common_positive_actions
	end

	def self.common_negative_actions
		common_negative_actions = []
		common_negative_actions << Action.find_by(name: "baby attack")
		common_negative_actions << Action.find_by(name: "causing distraction")
		common_negative_actions << Action.find_by(name: "not participating")
		common_negative_actions
	end

	def self.secondary_positive_actions
		secondary_positive_actions = []
		secondary_positive_actions << Action.find_by(name: "resisting distractions")
		secondary_positive_actions << Action.find_by(name: "respecting others")
		secondary_positive_actions << Action.find_by(name: "teamwork")
		secondary_positive_actions << Action.find_by(name: "high-quality work")
		secondary_positive_actions << Action.find_by(name: "leadership")
		secondary_positive_actions << Action.find_by(name: "helping others")
		secondary_positive_actions << Action.find_by(name: "not giving up")
		secondary_positive_actions
	end

	def self.secondary_negative_actions
		secondary_negative_actions = []
		secondary_negative_actions << Action.find_by(name: "sloppy SLANT")
		secondary_negative_actions << Action.find_by(name: "ignoring instructions")
		secondary_negative_actions << Action.find_by(name: "laughing at others")
		secondary_negative_actions << Action.find_by(name: "disrespecting others")
		secondary_negative_actions << Action.find_by(name: "lying")
		secondary_negative_actions << Action.find_by(name: "calling out")
		secondary_negative_actions << Action.find_by(name: "sloppy work")
		secondary_negative_actions << Action.find_by(name: "side conversation")
		secondary_negative_actions << Action.find_by(name: "swearing")
		secondary_negative_actions << Action.find_by(name: "dragging feet")
		secondary_negative_actions << Action.find_by(name: "academic dishonesty")
		secondary_negative_actions << Action.find_by(name: "hands on another student")
		secondary_negative_actions << Action.find_by(name: "sneakiness")
		secondary_negative_actions
	end
end

