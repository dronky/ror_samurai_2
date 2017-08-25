class Wagon < ApplicationRecord

  WAGON_TYPES = ["CoupeWagon", 'PlackartWagon', 'SitWagon', 'SvWagon']
  validates :type, inclusion: WAGON_TYPES

  belongs_to :train

  validates :train_id, :up_seats, :down_seats, presence: true
  validates :number, uniqueness: {scope: :train_id}

  scope :order_from_head,->(train) {train.head ? order(number: :asc) : order(number: :desc)}
  scope :coupe,     -> { where(type: 'CoupeWagon') }
  scope :platsckard, -> { where(type: 'PlatsckardWagon') }
  scope :sv,        -> { where(type: 'SvCarriageWagon') }
  scope :sit, -> { where(type: 'SitWagon') }


  before_validation :set_number

  def self.get_types
    WAGON_TYPES
  end

  private

  def set_number
    self.number ||= train.wagons.maximum(:number).to_i + 1
  end
end
