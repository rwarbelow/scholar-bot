# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
months  = (1..12).to_a
days    = (1..28).to_a
years   = ["1999", "2000", "2001", "2002", "2003"]
genders = ["female", "male"]
grades  = [6,7,8,9]
counter = 1
100.times do
	Student.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		password: "password",
		password_confirmation: "password",
		username: "student#{counter}",
		dob: "#{years.sample}-#{months.sample.to_s.rjust(2, "0")}-#{days.sample.to_s.rjust(2, "0")}",
		gender: "#{genders.sample}",
		id_num: "#{rand(10000*1000)}",
		grade: "#{grades.sample}",
		login_counter: 0
		)
	counter += 1
end

counter = 1
8.times do
	Teacher.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		password: "password",
		password_confirmation: "password",
		username: "student#{counter}",
		login_counter: 0
		)
end
