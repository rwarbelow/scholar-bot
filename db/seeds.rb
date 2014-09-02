# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Period.create(name:"Team")
(1..7).to_a.each do |p|
	Period.create(name:"#{p}")
end

# years 	= ["1999", "2000", "2001", "2002", "2003"]
# months 	= (1..12).to_a
# days 		= [1..28].to_a
# genders = ["female", "male"]
# grades  = (6..9).to_a

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

# counter = 1
# 8.times do
# 	Teacher.create(
# 		first_name: Faker::Name.first_name,
# 		last_name: Faker::Name.last_name,
# 		password: "password",
# 		password_confirmation: "password",
# 		email: Faker::Internet.safe_email,
# 		username: "teacher#{counter}",
# 		login_counter: 0,
# 		title: "example teacher",
# 		is_admin: false
# 		)
# 	counter += 1
# end

# admin = Teacher.create(
# 	first_name: "Admin",
# 	last_name: "Example",
# 	password: "password",
# 	password_confirmation: "password",
# 	email: Faker::Internet.safe_email,
# 	username: "admin",
# 	login_counter: 0,
# 	title: "admin",
# 	is_admin: true
# 	)

# 40.times do
# 	Course.create(
# 		teacher_id: Teacher.all.sample.id,
# 		subject: Faker::Company.catch_phrase,
# 		period_id: Period.all.sample.id
# 		)
# end

# Student.all.each do |s|
# 	s.enrollments.each do |e|
# 		e.course_id = Course.where(period_id: e.period_id).sample.id
# 		e.save
# 	end
# end


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

wi 				  = Action.create(grouping: "primary", value: true, name: "working independently")
							ActionCoreValue.create(core_value_id: respect.id, action_id: wi.id)
							ActionCoreValue.create(core_value_id: perseverance.id, action_id: wi.id)

part 			  = Action.create(grouping: "primary", value: true, name: "participation")
							ActionCoreValue.create(core_value_id: respect.id, action_id: part.id)
							ActionCoreValue.create(core_value_id: passion.id, action_id: part.id)
							ActionCoreValue.create(core_value_id: empowerment.id, action_id: part.id)
							ActionCoreValue.create(core_value_id: perseverance.id, action_id: part.id)

resdist 	  = Action.create(grouping: "secondary", value: true, name: "resisting distractions")
							ActionCoreValue.create(core_value_id: respect.id, action_id: resdist.id)
							ActionCoreValue.create(core_value_id: integrity.id, action_id: resdist.id)
							ActionCoreValue.create(core_value_id: perseverance.id, action_id: resdist.id)
							ActionCoreValue.create(core_value_id: empowerment.id, action_id: resdist.id)

respecting 	  = Action.create(grouping: "secondary", value: true, name: "respecting others")
							ActionCoreValue.create(core_value_id: respect.id, action_id: respecting.id)
							ActionCoreValue.create(core_value_id: team.id, action_id: respecting.id)

teamwork    = Action.create(grouping: "secondary", value: true, name: "teamwork")
							ActionCoreValue.create(core_value_id: respect.id, action_id: teamwork.id)
							ActionCoreValue.create(core_value_id: team.id, action_id: teamwork.id)

hq 				  = Action.create(grouping: "secondary", value: true, name: "high-quality work")
							ActionCoreValue.create(core_value_id: integrity.id, action_id: hq.id)
							ActionCoreValue.create(core_value_id: perseverance.id, action_id: hq.id)

probsolv    = Action.create(grouping: "primary", value: true, name: "problem-solving")
							ActionCoreValue.create(core_value_id: integrity.id, action_id: probsolv.id)
							ActionCoreValue.create(core_value_id: perseverance.id, action_id: probsolv.id)

leader 		  = Action.create(grouping: "secondary", value: true, name: "leadership")
							ActionCoreValue.create(core_value_id: passion.id, action_id: leader.id)
							ActionCoreValue.create(core_value_id: empowerment.id, action_id: leader.id)

help 			  = Action.create(grouping: "secondary", value: true, name: "helping others")
							ActionCoreValue.create(core_value_id: empowerment.id, action_id: help.id)
							ActionCoreValue.create(core_value_id: team.id, action_id: help.id)

ngiveup 	  = Action.create(grouping: "secondary", value: true, name: "not giving up")
							ActionCoreValue.create(core_value_id: perseverance.id, action_id: ngiveup.id)
							ActionCoreValue.create(core_value_id: passion.id, action_id: ngiveup.id)

baby 			  = Action.create(grouping: "primary", value: false, name: "baby attack")
							ActionCoreValue.create(core_value_id: respect.id, action_id: baby.id)
							ActionCoreValue.create(core_value_id: team.id, action_id: baby.id)

slopslant   = Action.create(grouping: "secondary", value: false, name: "sloppy SLANT")
							ActionCoreValue.create(core_value_id: respect.id, action_id: slopslant.id)
							ActionCoreValue.create(core_value_id: integrity.id, action_id: slopslant.id)
							ActionCoreValue.create(core_value_id: perseverance.id, action_id: slopslant.id)
							ActionCoreValue.create(core_value_id: passion.id, action_id: slopslant.id)

iginstr 	  = Action.create(grouping: "secondary", value: false, name: "ignoring instructions")
							ActionCoreValue.create(core_value_id: respect.id, action_id: iginstr.id)
							ActionCoreValue.create(core_value_id: integrity.id, action_id: iginstr.id)

laughing    = Action.create(grouping: "secondary", value: false, name: "laughing at others")
							ActionCoreValue.create(core_value_id: respect.id, action_id: laughing.id)
							ActionCoreValue.create(core_value_id: team.id, action_id: laughing.id)
							ActionCoreValue.create(core_value_id: empowerment.id, action_id: laughing.id)
							ActionCoreValue.create(core_value_id: integrity.id, action_id: laughing.id)

disrespect  = Action.create(grouping: "secondary", value: false, name: "disrespecting others")
							ActionCoreValue.create(core_value_id: respect.id, action_id: disrespect.id)
							ActionCoreValue.create(core_value_id: empowerment.id, action_id: disrespect.id)
							ActionCoreValue.create(core_value_id: team.id, action_id: disrespect.id)

lying 		  = Action.create(grouping: "secondary", value: false, name: "lying")
							ActionCoreValue.create(core_value_id: integrity.id, action_id: lying.id)
							ActionCoreValue.create(core_value_id: team.id, action_id: lying.id)

calling 	  = Action.create(grouping: "secondary", value: false, name: "calling out")
							ActionCoreValue.create(core_value_id: respect.id, action_id: calling.id)
							ActionCoreValue.create(core_value_id: team.id, action_id: calling.id)

slopwork 	  = Action.create(grouping: "secondary", value: false, name: "sloppy work")
							ActionCoreValue.create(core_value_id: respect.id, action_id: slopwork.id)
							ActionCoreValue.create(core_value_id: perseverance.id, action_id: slopwork.id)
							ActionCoreValue.create(core_value_id: integrity.id, action_id: slopwork.id)
							ActionCoreValue.create(core_value_id: passion.id, action_id: slopwork.id)

sideconvo   = Action.create(grouping: "secondary", value: false, name: "side conversation")
							ActionCoreValue.create(core_value_id: respect.id, action_id: sideconvo.id)
							ActionCoreValue.create(core_value_id: team.id, action_id: sideconvo.id)

swear 		  = Action.create(grouping: "secondary", value: false, name: "swearing")
							ActionCoreValue.create(core_value_id: respect.id, action_id: swear.id)
							ActionCoreValue.create(core_value_id: integrity.id, action_id: swear.id)
							ActionCoreValue.create(core_value_id: team.id, action_id: swear.id)

notpart 	  = Action.create(grouping: "primary", value: false, name: "not participating")
							ActionCoreValue.create(core_value_id: respect.id, action_id: notpart.id)
							ActionCoreValue.create(core_value_id: perseverance.id, action_id: notpart.id)
							ActionCoreValue.create(core_value_id: passion.id, action_id: notpart.id)
							ActionCoreValue.create(core_value_id: empowerment.id, action_id: notpart.id)
							ActionCoreValue.create(core_value_id: team.id, action_id: notpart.id)

dragfeet 	  = Action.create(grouping: "secondary", value: false, name: "dragging feet")
							ActionCoreValue.create(core_value_id: respect.id, action_id: dragfeet.id)
							ActionCoreValue.create(core_value_id: team.id, action_id: dragfeet.id)
							ActionCoreValue.create(core_value_id: passion.id, action_id: dragfeet.id)

dishonest   = Action.create(grouping: "secondary", value: false, name: "academic dishonesty")
							ActionCoreValue.create(core_value_id: integrity.id, action_id: dishonest.id)
							ActionCoreValue.create(core_value_id: perseverance.id, action_id: dishonest.id)
							ActionCoreValue.create(core_value_id: team.id, action_id: dishonest.id)

handsothers = Action.create(grouping: "secondary", value: false, name: "hands on another student")
							ActionCoreValue.create(core_value_id: integrity.id, action_id: handsothers.id)
							ActionCoreValue.create(core_value_id: team.id, action_id: handsothers.id)
							ActionCoreValue.create(core_value_id: respect.id, action_id: handsothers.id)

sneaky 		  = Action.create(grouping: "secondary", value: false, name: "sneakiness")
							ActionCoreValue.create(core_value_id: integrity.id, action_id: sneaky.id)
							ActionCoreValue.create(core_value_id: team.id, action_id: sneaky.id)

distract    = Action.create(grouping: "primary", value: false, name: "causing distraction")
							ActionCoreValue.create(core_value_id: team.id, action_id: distract.id)
							ActionCoreValue.create(core_value_id: respect.id, action_id: distract.id)


