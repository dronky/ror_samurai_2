class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route
  validates :station_number, uniqueness: {scope: :route_id}
  before_validation :set_number

  private

  def set_number
    # self.where(ids.last).update(station_number: self.pluck(:station_number).max + 1)
    puts '123'
  end
end
