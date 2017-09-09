class AddIndexesToWagons < ActiveRecord::Migration[5.1]
  def change
    add_index :wagons, [:id, :type]
  end
end
