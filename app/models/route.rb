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
      @route = Route.joins(:railway_stations_routes).where("railway_station_id = ?", first_station) &&
              Route.joins(:railway_stations_routes).where("railway_station_id = ?", last_station)
    else
      all
    end
  end
end