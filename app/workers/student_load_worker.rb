class StudentLoadWorker
	include Sidekiq::Worker

	def perform(rows)
		p "performing"
		Student.load_students(rows)
	end
end
