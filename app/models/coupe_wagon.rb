class CoupeWagon < Wagon
  validates :up_seats, :down_seats, presence: true
end