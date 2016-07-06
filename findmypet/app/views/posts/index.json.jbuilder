json.array!(@posts) do |post|
  json.extract! post, :id, :body, :owner_id
  json.url post_url(post, format: :json)
end
