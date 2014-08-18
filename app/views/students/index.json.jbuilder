json.array!(@students) do |student|
  json.extract! student, :id, :username, :password_digest, :first_name, :last_name, :email, :student_id, :dob, :grade, :gender
  json.url student_url(student, format: :json)
end
