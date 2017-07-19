class RailwayStation < ApplicationRecord
  has_and_belongs_to_many :routes
end
