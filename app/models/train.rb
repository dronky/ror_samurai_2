class Train < ApplicationRecord
  belongs_to :route
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation'
  has_many :wagons

  def seats_count
    second_class_count = wagons.joins(:wagon_type).where('wagon_types.title': :second_class_car).count
    compartment_count = wagons.joins(:wagon_type).where('wagon_types.title': :compartment_car).count
    seats = {second: second_class_count, comp: compartment_count}
  end
end


# attr_accessor :seats
#
# #code will be useful for setting the seats for wagons in the admin panel
# @all_up_seats = 10
# @all_down_seats = 10
# @seats = {up: 0, down: 0}
#
# def total_seats
#   total = 0
#   self.wagons.each do |wagon|
#     total+=wagon.up_seats
#     total+=wagon.down_seats
#   end
#   total
# end
#
# def set_seat(up_seats_count = 0, down_seats_count = 0)
#   raise "Up seats should more than 0" if @all_up_seats <= 0
#   raise "Down seats should more than 0" if @all_down_seats <= 0
#   if up_seats_count && down_seats_count
#     @seats[up] = up_seats_count
#     @all_up_seats -= up_seats_count
#     @seats[down] = down_seats_count
#     @all_down_seats_seats -= down_seats_count
#   end
# end
