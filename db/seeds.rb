# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Period.create(name:"All Team")
(1..7).to_a.each do |p|
	Period.create(name:"#{p}")
end

# counter = 1
# 100.times do
# 	student = Student.create(
# 		first_name: Faker::Name.first_name,
# 		last_name: Faker::Name.last_name,
# 		password: "password",
# 		password_confirmation: "password",
# 		username: "student#{counter}",
# 		dob: "#{years.sample}-#{months.sample.to_s.rjust(2, "0")}-#{days.sample.to_s.rjust(2, "0")}",
# 		gender: "#{genders.sample}",
# 		id_num: "#{rand(10000*1000)}",
# 		grade: "#{grades.sample}",
# 		login_counter: 0
# 		)
# 	Period.all.each do |p|
# 		student.enrollments.create(period_id: p.id)
# 	end
# 	counter += 1
# end

counter = 1
8.times do
	Teacher.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		password: "password",
		password_confirmation: "password",
		email: Faker::Internet.safe_email,
		username: "teacher#{counter}",
		login_counter: 0,
		title: "example teacher",
		is_admin: false
		)
	counter += 1
end

admin = Teacher.create(
	first_name: "Admin",
	last_name: "Example",
	password: "password",
	password_confirmation: "password",
	email: Faker::Internet.safe_email,
	username: "admin",
	login_counter: 0,
	title: "admin",
	is_admin: true
	)

40.times do
	Course.create(
		teacher_id: Teacher.all.sample.id,
		subject: Faker::Company.catch_phrase,
		period_id: Period.all.sample.id
		)
end

respect 			= CoreValue.create(name: "Respect & Humility", 
								 description: "Treating others the way you want to be treated. Showing gratitude for those who help you.")
integrity 		= CoreValue.create(name: "Integrity", 
								 description: "Doing the right thing when nobody is watching.")
perseverance 	= CoreValue.create(name: "Perseverance", 
								 description: "Continuing to work towards a goal despite obstacles and challenges.")
passion 			= CoreValue.create(name: "Passion", 
							   description: "Bringing energy and love to the people, ideas, and things you care about.")
empowerment 	= CoreValue.create(name: "Empowerment", 
	               description: "Taking control of your life and choices. Helping others to take control of their life and choices.")
team 					= CoreValue.create(name: "Team & Family", 
	               description: "Taking care of your peers, teacher, family, friends, and community.")

wi 				  = Action.create(value: true, name: "working independently")
part 			  = Action.create(value: true, name: "participation")
resdist 	  = Action.create(value: true, name: "resisting distractions")
respect 	  = Action.create(value: true, name: "respect to others")
teamwork    = Action.create(value: true, name: "teamwork")
hq 				  = Action.create(value: true, name: "high-quality work")
probsolv    = Action.create(value: true, name: "problem-solving")
leader 		  = Action.create(value: true, name: "leadership")
help 			  = Action.create(value: true, name: "helping others")
ngiveup 	  = Action.create(value: true, name: "not giving up")

baby 			  = Action.create(value: false, name: "baby attack")
slopslant   = ction.create(value: false, name: "sloppy SLANT")
iginstr 	  = Action.create(value: false, name: "ignoring instructions")
laughing    = Action.create(value: false, name: "laughing at others")
disrespect  = Action.create(value: false, name: "disrespecting others")
lying 		  = Action.create(value: false, name: "lying")
calling 	  = Action.create(value: false, name: "calling out")
slopwork 	  = Action.create(value: false, name: "sloppy work")
sideconvo   = Action.create(value: false, name: "side conversation")
swear 		  = Action.create(value: false, name: "swearing")
notpart 	  = Action.create(value: false, name: "not participating")
dragfeet 	  = Action.create(value: false, name: "dragging feet")
dishonest   = Action.create(value: false, name: "academic dishonesty")
handsothers = Action.create(value: false, name: "hands on another student")
sneaky 		  = Action.create(value: false, name: "sneakiness")
distract    = Action.create(value: false, name: "causing distraction")


