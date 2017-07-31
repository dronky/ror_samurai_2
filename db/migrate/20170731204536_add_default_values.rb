class AddDefaultValues < ActiveRecord::Migration[5.1]
  def change
    # change_column_null :wagons, :wagon_type, false
    change_column_default :wagons, :up_seats, 0
    change_column_default :wagons, :down_seats, 0
  end
end
