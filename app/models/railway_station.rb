class RailwayStation < ApplicationRecord
  has_and_belongs_to_many :routes
  has_many :trains, class_name:'Train', foreign_key: :current_station_id
end
