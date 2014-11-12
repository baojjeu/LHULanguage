json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :nickname, :gender, :description
  json.url profile_url(profile, format: :json)
end
