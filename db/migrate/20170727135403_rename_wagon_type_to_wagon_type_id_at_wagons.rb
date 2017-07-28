class RenameWagonTypeToWagonTypeIdAtWagons < ActiveRecord::Migration[5.1]
  def change
    rename_column :wagons, :wagon_type, :wagon_type_id
  end
end
