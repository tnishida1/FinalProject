json.array!(@posts) do |post|
  json.extract! post, :id, :post_type
  json.url post_url(post, format: :json)
end
