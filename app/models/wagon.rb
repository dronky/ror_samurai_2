class Wagon < ApplicationRecord

  WAGON_TYPES = ["CoupeWagon", 'PlackartWagon', 'SitWagon', 'SvWagon']
  validates :type, inclusion: WAGON_TYPES

  has_one :train

  validates :up_seats, :down_seats, presence: true
  validates :number, uniqueness: true

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
    self.number ||= Wagon.last.number + 1
  end
end
