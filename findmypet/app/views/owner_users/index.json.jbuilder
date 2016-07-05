json.array!(@owner_users) do |owner_user|
  json.extract! owner_user, :id, :owner_id, :user_id
  json.url owner_user_url(owner_user, format: :json)
end
