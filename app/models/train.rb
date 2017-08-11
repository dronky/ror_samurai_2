class Train < ApplicationRecord
  belongs_to :route
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation'
  has_many :wagons

  def seats_count
    second_class_count = wagons.where(wagon_type: :PlackartWagon).count
    compartment_count = wagons.where(wagon_type: :CoupeWagon).count
    seats = {second: second_class_count, comp: compartment_count}
  end

  def select_seats(wagon_type, seats_type)
    self.wagons.where(wagon_type: wagon_type).sum(seats_type.to_sym)
  end
end
