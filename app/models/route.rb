class Route < ActiveRecord::Base
  validates :name, presence: true

  has_and_belongs_to_many :railway_stations
  has_many :trains
  has_many :railway_stations_routes

  # before_validation :set_name, on: :create

  def get_station_arrival(station_id)
    station_route(station_id, 'station_arrival').station_arrival
  end

  def get_station_departure(station_id)
    station_route(station_id, 'station_departure').station_departure
  end

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  private

  def self.search(first_station, last_station)
    @routes = Route.joins(:railway_stations_routes).where("railway_station_id = ?", Integer(first_station["id"])) &&
        Route.joins(:railway_stations_routes).where("railway_station_id = ?", Integer(last_station["id"]))
  end

  private

  def station_route(station_id, type)
    railway_stations_routes.select(type.to_sym).where(route: self, railway_station_id: Integer(station_id)).first
  end

end