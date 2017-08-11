class Route < ActiveRecord::Base
  validates :name, presence: true

  has_and_belongs_to_many :railway_stations
  has_many :trains
  has_many :railway_stations_routes

  before_validation :set_name

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def self.search(first_station, last_station)
    if first_station && last_station
      p first_station

      RailwayStationsRoute.select(:route_id).where("railway_station_id = #{first_station} or railway_station_id = #{last_station}")
      #вверху мы взяли роут, в который входит 1 из станций. Надо проверить его на вхождение другой станции еще в 1 запросе



      #RailwayStationsRoute.select(:route_id).where("(railway_station_id = #{first_station} and railway_station_id = #{last_station})").first.route_id
      #@route = Route.find(2)
    else
      all
    end
  end
end