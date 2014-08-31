module StudentsHelper

	def color_for(percentage)
		case percentage
		when 95..100 then "blue"
		when 80..94 then "green"
		when 70..79 then "yellow"
		when 0..69 then "red"
		end
	end
end
