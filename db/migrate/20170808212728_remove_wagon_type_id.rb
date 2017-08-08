class RemoveWagonTypeId < ActiveRecord::Migration[5.1]
  def change
    remove_column(:wagons, :wagon_type_id)
  end
end
