class RemoveStationNumber < ActiveRecord::Migration[5.1]
  def change
    remove_column :routes, :station_number
  end
end
