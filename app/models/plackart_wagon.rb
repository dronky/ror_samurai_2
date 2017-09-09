class PlackartWagon < Wagon
  validates :up_seats, :down_seats, :side_up_seats, :side_down_seats, presence: true
end