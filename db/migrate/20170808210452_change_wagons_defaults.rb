class ChangeWagonsDefaults < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:wagons, :side_up_seats, 20)
    change_column_default(:wagons, :side_down_seats, 20)
    change_column_default(:wagons, :sit_seats, 10)
  end
end
