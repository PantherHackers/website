json.array!(@events) do |event|
  json.extract! event, :id, :title, :body, :start, :end, :posted, :id, :author
  json.url event_url(event, format: :json)
end
