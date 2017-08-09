class ChangeWagon < ActiveRecord::Migration[5.1]
  def change
    add_index :wagons, [:number, :train_id], unique: true
  end
end
