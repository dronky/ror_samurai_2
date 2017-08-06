class Route < ActiveRecord::Base
  validates :name, presence: true

  has_and_belongs_to_many :railway_stations
  has_many :trains
  has_many :railway_stations_routes

  before_validation :set_name

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

end