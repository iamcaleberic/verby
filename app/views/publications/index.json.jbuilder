json.array!(@publications) do |publication|
  json.extract! publication, :id, :title, :pen_name, :body, :email, :comments, :likes, :dislikes
  json.url publication_url(publication, format: :json)
end
