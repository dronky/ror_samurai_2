class RemoveStartStationAndEndStationFromTickets < ActiveRecord::Migration[5.1]
  def change
    remove_column :tickets, :start_station, :integer
    remove_column :tickets, :end_station, :integer
  end
end
