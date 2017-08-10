class Wagon < ApplicationRecord

  WAGON_TYPES = ["CoupeWagon", 'PlackartWagon', 'SitWagon', 'SvWagon']
  validates :wagon_type, inclusion: WAGON_TYPES

  belongs_to :train

  validates :train_id, :up_seats, :down_seats, presence: true
  validates :number, uniqueness: {scope: :train_id}

  scope :order_from_head,->(train) {train.head ? order(number: :asc) : order(number: :desc)}
  # scope :order_from_head,-> {train.head ? order(number: :asc) : order(number: :desc)}
  # почему этот метод не работает? Ведь 2.4.0 :013 > Wagon.first.train.head возвращает true. Или тут проблема в зонах видимости?

  before_validation :set_number

  def get_types
    WAGON_TYPES
  end

  private

  def set_number
    current_max_number = self.train.wagons.pluck(:number).max
    self.number = current_max_number + 1
  end
end
