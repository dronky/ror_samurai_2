class Train < ApplicationRecord
  belongs_to :route
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation'
  has_many :wagons

  scope :coupe,     -> { where(type: 'CoupeWagon') }
  scope :platsckard, -> { where(type: 'PlatsckardWagon') }
  scope :sv,        -> { where(type: 'SvCarriageWagon') }
  scope :sit, -> { where(type: 'Sit_wagon') }

  before_validation :set_station

  def seats_count
    second_class_count = wagons.where(type: :PlackartWagon).count
    compartment_count = wagons.where(type: :CoupeWagon).count
    seats = {second: second_class_count, comp: compartment_count}
  end

  def set_station
    station_id = route.railway_stations_routes.minimum(:railway_station_id)
    self.current_station = RailwayStation.find(station_id)
  end

  def select_seats(type, seats_type)
    self.wagons.where(type: type).sum(seats_type.to_sym)
  end
end
