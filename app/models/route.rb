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
      @routes = Route.joins(:railway_stations_routes).where(["railway_stations_routes.railway_station_id = #{first_station[:station_id]}"]) &&
              Route.joins(:railway_stations_routes).where(["railway_stations_routes.railway_station_id = #{last_station[:station_id]}"])
    else
      all
    end
  end
end