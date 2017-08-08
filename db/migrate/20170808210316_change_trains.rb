class ChangeTrains < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:trains, :head, true)
  end
end
