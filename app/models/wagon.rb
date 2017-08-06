class Wagon < ApplicationRecord
  belongs_to :train
  belongs_to :wagon_type

  validates :train_id, :up_seats, :down_seats, presence: true
  validates :wagon_number, uniqueness: {scope: :train_id}

  scope :order_from_head,->(train) {train.head ? order(wagon_number: :asc) : order(wagon_number: :desc)}
  # scope :order_from_head,-> {train.head ? order(wagon_number: :asc) : order(wagon_number: :desc)}
  # почему этот метод не работает? Ведь 2.4.0 :013 > Wagon.first.train.head возвращает true. Или тут проблема в зонах видимости?

  before_create :set_wagon_number

  private

  def set_wagon_number
    current_max_number = self.train.wagons.pluck(:wagon_number).max
    self.wagon_number = current_max_number + 1
  end
end
