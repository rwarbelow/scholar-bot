json.array!(@guardianships) do |guardianship|
  json.extract! guardianship, :id, :student_id, :guardian_id
  json.url guardianship_url(guardianship, format: :json)
end
