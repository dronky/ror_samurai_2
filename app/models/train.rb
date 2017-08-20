class Train < ApplicationRecord
  belongs_to :route
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation'
  has_many :wagons

  scope :coupe,     -> { where(type: 'CoupeWagon') }
  scope :platsckard, -> { where(type: 'PlatsckardWagon') }
  scope :sv,        -> { where(type: 'SvCarriageWagon') }
  scope :sit, -> { where(type: 'Sit_wagon') }

  def seats_count
    second_class_count = wagons.where(type: :PlackartWagon).count
    compartment_count = wagons.where(type: :CoupeWagon).count
    seats = {second: second_class_count, comp: compartment_count}
  end

  def set_station
    self.current_station = RailwayStation.joins(:railway_stations_routes).where("route_id = ?", self.route_id) &&
        RailwayStation.joins(:railway_stations_routes).where("station_number = 1").first
  end

  def select_seats(type, seats_type)
    self.wagons.where(type: type).sum(seats_type.to_sym)
  end
end
