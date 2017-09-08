class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user
  belongs_to :start_station, class_name: 'RailwayStation'
  belongs_to :end_station, class_name: 'RailwayStation'
  before_save :set_user_name, on: :create

  after_create :send_new_ticket
  def route_name
    "#{start_station.title} - #{end_station.title}"
  end

  def set_user_name
    self.full_name =  self.user.name
  end

  def send_new_ticket
    TicketMailer.buy_ticket(self.user,self).deliver_now
  end
end
