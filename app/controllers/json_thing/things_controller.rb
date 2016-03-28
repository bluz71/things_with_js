class JsonThing::ThingsController < ApplicationController
  def rendered
    thing = Thing.new
    thing.id = 99
    thing.name = ["Action", "Cable", "Rails", "Book", "Target"].sample
    thing.count = rand(99)
    render json: thing.as_json(only: [:id, :name, :count])
  end

  def jbuildered
    @thing = Thing.new
    @thing.id = 98
  end

  def collection
    @things = []
    @things << Thing.new(id: 97)
    @things << Thing.new(id: 96)
    @things << Thing.new(id: 95)
  end
end
