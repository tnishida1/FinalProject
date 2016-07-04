json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :claimed, :owner_id
  json.url pet_url(pet, format: :json)
end
