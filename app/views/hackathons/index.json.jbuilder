json.array!(@hackathons) do |hackathon|
  json.extract! hackathon, :id, :name, :date, :location, :highschool, :logo, :site
  json.url hackathon_url(hackathon, format: :json)
end
