class Route < ActiveRecord::Base
  validates :name, presence: true
  has_and_belongs_to_many :railway_stations
  has_many :trains
end