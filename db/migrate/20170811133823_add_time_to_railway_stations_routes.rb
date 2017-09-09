class AddTimeToRailwayStationsRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :railway_stations_routes, :station_arrival, :time
    add_column :railway_stations_routes, :station_departure, :time
  end
end
