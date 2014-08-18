json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :username, :password_digest, :first_name, :last_name, :email, :title
  json.url teacher_url(teacher, format: :json)
end
