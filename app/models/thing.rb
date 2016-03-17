class Thing < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 4}
  validates :count, numericality: {only_integer: true}
end
