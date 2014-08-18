json.array!(@guardians) do |guardian|
  json.extract! guardian, :id, :username, :password_digest, :first_name, :last_name, :email
  json.url guardian_url(guardian, format: :json)
end
