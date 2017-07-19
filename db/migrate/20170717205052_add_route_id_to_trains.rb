class AddRouteIdToTrains < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :route_id, :integer
  end
end
