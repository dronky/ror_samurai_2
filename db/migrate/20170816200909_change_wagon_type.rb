class ChangeWagonType < ActiveRecord::Migration[5.1]
  def change
    rename_column :wagons, :wagon_type, :type
  end
end
