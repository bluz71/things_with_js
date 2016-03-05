json.array!(@things) do |thing|
  json.extract! thing, :id, :name, :count
  json.url thing_url(thing, format: :json)
end
