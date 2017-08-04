class SvWagon < Wagon
  validates :down_seats, presence: true
  # before_create :set_wagon_type
  #
  # private
  # def set_wagon_type
  #   self.wagon_type = sv
  # end
end