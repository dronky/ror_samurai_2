class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user
  belongs_to :start_station, class_name: 'RailwayStation'
  belongs_to :end_station, class_name: 'RailwayStation'
  before_save :set_user_name, on: :create

  def set_user_name
    self.full_name =  self.user.name
  end
end
