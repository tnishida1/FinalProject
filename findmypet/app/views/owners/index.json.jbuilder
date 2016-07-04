json.array!(@owners) do |owner|
  json.extract! owner, :id, :first, :last, :zipcode
  json.url owner_url(owner, format: :json)
end
