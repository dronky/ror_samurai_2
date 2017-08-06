class AddWagonNumberToWagons < ActiveRecord::Migration[5.1]
  def change
    add_column :wagons, :wagon_number, :integer
  end
end
