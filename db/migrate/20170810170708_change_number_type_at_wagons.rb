class ChangeNumberTypeAtWagons < ActiveRecord::Migration[5.1]
  def change
    change_column :wagons, :number, :integer
  end
end
