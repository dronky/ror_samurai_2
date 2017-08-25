class RailwayStation < ApplicationRecord
  has_and_belongs_to_many :routes
  has_many :trains, class_name:'Train', foreign_key: :current_station_id
  has_many :railway_stations_routes

  scope :ordered, -> { select('railway_stations.*, railway_stations_routes.station_number').joins(:railway_stations_routes).order("railway_stations_routes.station_number").uniq }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(station_number: position) if station_route
  end

  def position_in(route)
    station_route(route)&.station_number
  end

  protected

  def station_route(route)
    station_route ||= railway_stations_routes.where(route: route).first
  end
end
