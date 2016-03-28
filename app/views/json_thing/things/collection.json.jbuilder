json.array! @things do |thing|
  json.id thing.id
  json.name ["Live", "Home", "Ruby", "Concert", "Making"].sample
  json.count rand(40)
end
