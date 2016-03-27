class JsonThing::ThingsController < ApplicationController
  def rendered
    thing = Thing.new
    thing.name = ["Action", "Cable", "Rails", "Book", "Target"].sample
    thing.count = rand(99)
    render json: thing.as_json(only: [:id, :name, :count])
  end
end
