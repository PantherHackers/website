json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body, :posted, :id, :author
  json.url post_url(post, format: :json)
end
