class Wagon < ApplicationRecord
  belongs_to :train
  belongs_to :wagon_type

  validates :train_id, :wagon_type_id, :up_seats, :down_seats, presence: true

  after_commit :set_wagon_number

  private

  def set_wagon_number

  end
end

