class Train < ApplicationRecord

  before_validation :set_station, on: :create

  belongs_to :route
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation'
  has_many :wagons

  def wagons_seats_count
    second_class_count = wagons.where(type: :PlackartWagon).count
    compartment_count = wagons.where(type: :CoupeWagon).count
    sit_count = wagons.where(type: :SitWagon).count
    {second: second_class_count, comp: compartment_count, sit: sit_count}
  end

  def select_seats(type, seats_type)
    self.wagons.where(type: type).sum(seats_type.to_sym)
  end

  private

  def set_station
    station_id = route.railway_stations_routes.minimum(:railway_station_id)
    self.current_station = RailwayStation.find(station_id)
  end

end
