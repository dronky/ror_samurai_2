class RenameTraindIdToTrainId < ActiveRecord::Migration[5.1]
  def change
    rename_column :wagons, :traind_id, :train_id
  end
end
