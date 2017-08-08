class Wagon < ApplicationRecord
  WAGON_TYPES = ['CoupeWagon', 'PlackartWagon', 'SitWagon', 'SvWagon']
  validates :type, inclusion: WAGON_TYPES

  belongs_to :train
  belongs_to :wagon_type

  validates :train_id, :up_seats, :down_seats, presence: true
  validates :number, uniqueness: {scope: :train_id}

  scope :order_from_head,->(train) {train.head ? order(number: :asc) : order(number: :desc)}
  # scope :order_from_head,-> {train.head ? order(number: :asc) : order(number: :desc)}
  # почему этот метод не работает? Ведь 2.4.0 :013 > Wagon.first.train.head возвращает true. Или тут проблема в зонах видимости?

  before_create :set_number

  private

  def set_number
    current_max_number = self.train.wagons.pluck(:number).max
    self.number = current_max_number + 1
  end
end
