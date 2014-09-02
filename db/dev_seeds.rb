
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

