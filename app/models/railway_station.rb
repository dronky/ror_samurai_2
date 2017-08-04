class RailwayStation < ApplicationRecord
  has_and_belongs_to_many :routes
  has_many :trains, class_name:'Train', foreign_key: :current_station_id
  has_many :railway_stations_routes

  scope :ordered, -> { select('railway_stations.*, railway_stations_routes.station_number').joins(:railway_stations_routes).order("railway_stations_routes.station_number").uniq }

end
