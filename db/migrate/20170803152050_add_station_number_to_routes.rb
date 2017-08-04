class AddStationNumberToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :station_number, :integer, default: 1
  end
end
