class ChangeWagons < ActiveRecord::Migration[5.1]
  def change
    rename_column(:wagons, :number, :number)
  end
end
