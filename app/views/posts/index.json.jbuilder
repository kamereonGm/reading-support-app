json.array!(@shelves) do |shelf|
  json.extract! shelf, :id, :title, :content
  json.start shelf.created_at
  json.end shelf.finish_on
  json.url "/posts/shelf/#{shelf.id}"
end
