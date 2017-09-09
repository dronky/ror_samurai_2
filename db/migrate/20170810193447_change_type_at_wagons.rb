class ChangeTypeAtWagons < ActiveRecord::Migration[5.1]
  def change
    rename_column :wagons, :type, :wagon_type
  end
end
