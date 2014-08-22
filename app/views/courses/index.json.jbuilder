json.array!(@courses) do |course|
  json.extract! course, :id, :teacher_id, :period, :subject
  json.url course_url(course, format: :json)
end
